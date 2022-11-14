//
//  CustomTabbarVC.swift
//  Kusu
//
//  Created by Kirit on 12/11/22.
//

import UIKit

class CustomTabbarVC: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.barTintColor = .white
        self.tabBar.backgroundColor = .clear
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }


    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        if viewController is SBUChannelListViewController{
//            self.present(SBUChannelListViewController(), animated: true)
//            return false
//        } else {
//            return true
//        }
        return true
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let appDelegate = AppDelegate.sharedAppDelegate()
        if tabBarController?.selectedIndex == 0
        {
            
            //appDelegate.navHome.popViewController(animated: true)
        }else if tabBarController?.selectedIndex == 1
        {
            //appDelegate.navDiscover.popViewController(animated: true)
        }else if tabBarController?.selectedIndex == 2
        {
            //appDelegate.navCreateNew.popViewController(animated: true)
        }else if tabBarController?.selectedIndex == 3
        {
            ///appDelegate.navActivity.popViewController(animated: true)
        }else if tabBarController?.selectedIndex == 4
        {
            //appDelegate.navProfile.popViewController(animated: true)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
