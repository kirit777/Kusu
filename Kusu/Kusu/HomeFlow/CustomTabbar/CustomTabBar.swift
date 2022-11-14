//
//  CustomTabBar.swift
//  Kusu
//
//  Created by Kirit on 14/11/22.
//

import Foundation
import UIKit



protocol CustomTabBarDelegate {

    func setSelectedTabIndex(index:Int)

}



class CustomTabBar: UIView {



//    override func viewDidLoad() {

//        super.viewDidLoad()

//

//        // Do any additional setup after loading the view.

//    }



    var customTabDelegate:CustomTabBarDelegate? = nil



    

    

    class func instanceFromNib() -> UIView {

        return UINib(nibName: "CustomTabBar", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView

    }

    

    //    @IBAction func btnHomeClicked(_ sender: Any) {

    //

    //        customTabDelegate?.setSelectedTabIndex(index: 0)

    //        setSelectedButtonAtIndex(index: 0)

    //    }

    //    @IBAction func btnDiscoverClicked(_ sender: Any) {

    //

    //        customTabDelegate?.setSelectedTabIndex(index: 1)

    //        setSelectedButtonAtIndex(index: 1)

    //    }

    //    @IBAction func btnCreateNewClicked(_ sender: Any) {

    //        customTabDelegate?.setSelectedTabIndex(index: 2)

    //        //setSelectedButtonAtIndex(index: 2)

    //    }

    //    @IBAction func btnActivityClicked(_ sender: Any) {

    //        customTabDelegate?.setSelectedTabIndex(index: 3)

    //        setSelectedButtonAtIndex(index: 3)

    //    }

    //    @IBAction func btnProfileClicked(_ sender: Any) {

    //        customTabDelegate?.setSelectedTabIndex(index: 4)

    //        setSelectedButtonAtIndex(index: 4)

    //    }

    

    func setSelectedButtonAtIndex(index:Int)

    {

//        btnHome.isSelected = false

//        btnDiscover.isSelected = false

//        btnCreateNew.isSelected = false

//        btnActivity.isSelected = false

//        btnProfile.isSelected = false



        

        if index == 0

        {

//            btnDiscover.tintColor = UIColor.COLOR_SHADOW

//            btnProfile.tintColor = UIColor.COLOR_SHADOW

//            btnActivity.tintColor = UIColor.COLOR_SHADOW

//            btnHome.isSelected = true

//            btnHome.tintColor = UIColor.COLOR_BUTTON_THEME

        }else if index == 1

        {

//            btnHome.tintColor = UIColor.COLOR_SHADOW

//            btnProfile.tintColor = UIColor.COLOR_SHADOW

//            btnActivity.tintColor = UIColor.COLOR_SHADOW

//            btnDiscover.isSelected = true

//            btnDiscover.tintColor = UIColor.COLOR_BUTTON_THEME

            

        }else if index == 2

        {

//            btnHome.tintColor = UIColor.COLOR_SHADOW

//            btnDiscover.tintColor = UIColor.COLOR_SHADOW

//            btnProfile.tintColor = UIColor.COLOR_SHADOW

//            btnActivity.tintColor = UIColor.COLOR_SHADOW

//            btnCreateNew.isSelected = true

        }else if index == 3

        {

//            btnHome.tintColor = UIColor.COLOR_SHADOW

//            btnDiscover.tintColor = UIColor.COLOR_SHADOW

//            btnProfile.tintColor = UIColor.COLOR_SHADOW

//            btnActivity.isSelected = true

//            btnActivity.tintColor = UIColor.COLOR_BUTTON_THEME

        }else if index == 4

        {

//            btnHome.tintColor = UIColor.COLOR_SHADOW

//            btnDiscover.tintColor = UIColor.COLOR_SHADOW

//            btnActivity.tintColor = UIColor.COLOR_SHADOW

//            btnProfile.isSelected = true

//            btnProfile.tintColor = UIColor.COLOR_BUTTON_THEME

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
