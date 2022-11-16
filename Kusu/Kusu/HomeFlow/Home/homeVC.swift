//
//  homeVC.swift
//  Kusu
//
//  Created by Kirit on 12/11/22.
//

import UIKit

class homeVC: UIViewController {
    
    @IBOutlet weak var cvStory: UICollectionView!
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
        
        
        self.cvStory.delegate = self
        self.cvStory.dataSource = self
        
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
        cvStory.register(UINib(nibName: "StoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StoryCollectionViewCell")
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
        cvStory.reloadData()
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
        if arrList.count > 0 {
            if let dict = arrList.object(at: indexPath.row) as? NSMutableDictionary{
                cell!.setCellData(dict:dict)
            }
        }
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

extension homeVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(arrList.count)
        return arrList.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10.0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10.0
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = 100
        let cellSize = CGSize(width: size, height: size)
        return cellSize
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        // if collectionView == collectionListFull {
//        switch kind {
//
//        case UICollectionView.elementKindSectionFooter:
//
//            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionViewLoading", for: indexPath) as! CollectionViewLoading
//            if isLoading {
//                footerView.setLoadingWithImage(title: String.str_Loading, subtitle: "", img: "")
//            } else {
//                print(self.arrList.count)
//                if self.arrList.count == 0 {
//                    footerView.setLoadingWithImage(title: String.str_No_video, subtitle: "", img: "empty")
//                }
//            }
//            return footerView
//
//        default:
//            print("Unexpected element kind")
//        }
//        return UICollectionReusableView()
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if arrList.count == 0 {
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
        //cell.delagatePostList = self
        if arrList.count > indexPath.row {
            if let dict = arrList.object(at: indexPath.row) as? NSDictionary {
                cell.setCellData(dict: dict.mutableCopy() as! NSMutableDictionary)
            }
        }
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("array count : \(arrList.count)")
//        if arrList.count > indexPath.row {
//            let previewVC = MainStoryboard.storyBoard.instantiateViewController(withIdentifier: "PreviewViewController") as? PreviewViewController
//            previewVC?.arrAllStory = NSMutableArray(array: self.arrList)
//            previewVC?.CurrentIndex = indexPath.row
//            previewVC?.pageCount = self.pageCount
//            let nav = UBNavigationController(rootViewController: previewVC!)
//            nav.modalPresentationStyle = .fullScreen
//            self.present(nav, animated: true, completion: nil) // navigationController?.
//        }
//    }
}
