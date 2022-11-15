//
//  homeVC.swift
//  Kusu
//
//  Created by Kirit on 12/11/22.
//

import UIKit

class homeVC: UIViewController {
    
    @IBOutlet weak var cvPosts: UITableView!
    var arrList : NSMutableArray!
    var isLoadMore:Bool!
    var isLoading:Bool!
    var refreshControl : UIRefreshControl!
    var pageIndex : Int!
    
    var pageCount : Int!
    
    
    var almoGetPost : AlmofireUtility!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        arrList = NSMutableArray()
       // cvPosts.register(UINib(nibName: "CollectionViewLoading", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "CollectionViewLoading")
        self.cvPosts.delegate = self
        self.cvPosts.dataSource = self
        
        refreshControl = UIRefreshControl()
        self.cvPosts.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        self.refreshData()
        
    }

    @objc func refreshData() {
        self.setUserSearchView()
    }
    
    func setUserSearchView() {
        self.cvPosts.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
        pageCount = 1
        self.getPostList(page: pageCount)
    }
    
    func getPostList(page : Int) {
        if page == 1 {
            arrList.removeAllObjects()
        }
        
        almoGetPost = AlmofireUtility()
        almoGetPost.delegateAlmo = self
        
        let dict = NSMutableDictionary()
        dict["page"] = "\(page)"
        dict["limit"] = "12"
        dict["method"] = "get_post_list"
        dict["page"] = "1"
        
        isLoading = true
        
        almoGetPost.almoRequestWithDict(strUrl: "https://nwo.capital/app/state/api//post", method: .post, dictParam: dict, isHeader: true)
    }

    func removeLoading() {
        cvPosts.reloadData()
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
        //constraintPagingContainer.constant = 0
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if(scrollView == cvPosts){
            let offset = cvPosts.contentOffset
            let bounds = cvPosts.bounds
            let size1  = cvPosts.contentSize
            let inset  = cvPosts.contentInset
            
            let y = Int(offset.y + bounds.size.height - inset.bottom)
            let h = Int(size1.height)
            let reload_distance = 0
            //if (h > Int(UIScreen.main.bounds.size.height)) {
            if(y > (h + reload_distance)){
                if(isLoadMore){
                    print("Y VALUE : \(y)")
                    isLoadMore = false
                    //contrainLoading.constant = 40
                    self.perform(#selector(fetchNextPage), with: nil, afterDelay: 1)
                }
            }
        }
    }
    
    @objc func fetchNextPage(){
        if(arrList.count > 0){
            pageCount = pageCount + 1
            self.getPostList(page: pageCount)
        }
    }
    

}


extension homeVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell
        
        return cell!
    }
}


extension homeVC : AlmofireUtilityDelegate {
    func afmofireSucess(almofire: AlmofireUtility, dicsResponse: NSDictionary) {
        if almofire == almoGetPost {
            if dicsResponse != nil {
            print(dicsResponse)
            //AppDelegate.sharedAppDelegate().hideLoadingView()
            self.isLoading = false
            let msg = dicsResponse["message"] as? String
            if let status = dicsResponse["status"] as? Int {
                if status == 1 {
                    if dicsResponse.count > 0 { //for _ in 0..<dicsResponse.count {
                        if let data = dicsResponse.object(forKey: "data") as? NSMutableArray {
                            self.arrList.addObjects(from: data as! [Any])
                        }
                    }
                } else if status == 2 {
                    if msg!.count > 0 {
//                        displayCustomAlert(title: "", message: msg!, viewController: self) { (yes) in
//                            AppDelegate.sharedAppDelegate().setLogout()
//                        }
                    }
                } else {
                    if msg!.count > 0 {
                       // displayCustomAlert(title: "", message: msg!, viewController: self)
                    }
                }
            }
            self.removeLoading()
        }
    }
    }
    
    func afmofireFail(almofire: AlmofireUtility, error: NSError) {
       // AppDelegate.sharedAppDelegate().hideLoadingView()
       // displayCustomAlert(title: "", message: String.str_something_wrong, viewController: self)
        self.removeLoading()
        print(error)
    }
}
