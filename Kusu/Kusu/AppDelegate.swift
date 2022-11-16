//
//  AppDelegate.swift
//  Kusu
//
//  Created by Kirit on 11/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, CAAnimationDelegate,CustomTabBarDelegate {
    func setSelectedTabIndex(index: Int) {
        //
    }
    
    
    
    
    
    
    var window:UIWindow?
    var customTabBar:CustomTabBar!
    var tabBarController:CustomTabbarVC!
    
    class func sharedAppDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        application.statusBarStyle = .lightContent
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        
        redirectHome()
        
        return true
    }
    
    func redirectHome(){
        
        
        let homeVC = homeVC.init(nibName: "homeVC", bundle: nil)
        let navHome = UINavigationController(rootViewController: homeVC)
        
        let searchVC = SearchHomeVC.init(nibName: "SearchHomeVC", bundle: nil)
        let navSearch = UINavigationController(rootViewController: searchVC)
        
        
        let createPostVC = CreatePostVC.init(nibName: "CreatePostVC", bundle: nil)
        let navCreatePost = UINavigationController(rootViewController: createPostVC)
        
        let notificationVC = NotificationVC.init(nibName: "NotificationVC", bundle: nil)
        let navNotification = UINavigationController(rootViewController: notificationVC)
        
        let accountVC = AccountVC.init(nibName: "AccountVC", bundle: nil)
        let navAccount = UINavigationController(rootViewController: accountVC)
        
        
        tabBarController = CustomTabbarVC()
       // customTabBar = CustomTabBar.instanceFromNib() as? CustomTabBar
        let myviewControllers = [navHome , navSearch , navCreatePost , navNotification , navAccount] as? [UINavigationController]
        tabBarController?.setViewControllers(myviewControllers, animated: true)
        setSelectedTabIndex(index: 0)
        if (customTabBar != nil){
            if DeviceType.IS_IPHONE_X_series {
               // customTabBar?.frame = CGRect(x: 0, y: DeviceSize.height - 83, width: DeviceSize.width, height: 83.0)
            }else{
                //customTabBar?.frame = CGRect(x: 0, y: DeviceSize.height - 49, width: DeviceSize.width, height: 49.0)
            }
           // customTabBar?.customTabDelegate = self
            //customTabBar?.backgroundColor = UIColor.white
            //self.tabBarController?.view.addSubview(customTabBar!)
            
            
            //        let CustomeTabBar = CustomTabbarVC.init(nibName: "CustomTabbarVC", bundle: nil)
            //
            //        let homeVC = homeVC.init(nibName: "homeVC", bundle: nil)
            //        let navHome = UINavigationController(rootViewController: homeVC)
            //
            //        CustomeTabBar.viewControllers = [nav]
            self.window?.rootViewController = tabBarController
            self.window!.makeKeyAndVisible()
            
            TransitionAnimation()
        }
        
        self.window?.rootViewController = tabBarController
        self.window!.makeKeyAndVisible()
        
        TransitionAnimation()
        
        
        func TransitionAnimation(){
            
            let animation = CATransition()
            animation.delegate = self
            animation.type = CATransitionType.fade
            animation.duration = CFTimeInterval(1.0)
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
            self.window?.layer.add(animation, forKey: "transitionViewAnimation")
        }
        
        func setSelectedTabIndex(index: Int) {
            if index == 2{
//
            }else{
                if tabBarController?.selectedIndex == index {
                    //return
                }
                tabBarController?.selectedIndex = index
                customTabBar?.setSelectedButtonAtIndex(index: index)
            }
        }
        
        
    }
}
