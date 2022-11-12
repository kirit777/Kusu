//
//  AppDelegate.swift
//  Kusu
//
//  Created by Kirit on 11/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, CAAnimationDelegate {

    var window:UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        redirectHome()
        
        return true
    }
    
    func redirectHome(){
        let CustomeTabBar = CustomTabbarVC.init(nibName: "CustomTabbarVC", bundle: nil)
        
        
        let homeVC = homeVC.init(nibName: "homeVC", bundle: nil)
        let nav = UINavigationController(rootViewController: homeVC)
        
        CustomeTabBar.viewControllers = [nav]
        self.window?.rootViewController = CustomeTabBar
        TransitionAnimation()
    }
    

    func TransitionAnimation(){
        
        let animation = CATransition()
        animation.delegate = self
        animation.type = CATransitionType.fade
        animation.duration = CFTimeInterval(1.0)
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        self.window?.layer.add(animation, forKey: "transitionViewAnimation")
    }
}

