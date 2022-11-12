//
//  CommonClass.swift
//  Kusu
//
//  Created by Kirit on 12/11/22.
//

import UIKit

struct MainStoryboard {
    static let storyBoard = UIStoryboard(name: "Main", bundle: nil)
}

struct DeviceSize {
    static let width:CGFloat = UIScreen.main.bounds.width
    static let height:CGFloat = UIScreen.main.bounds.height
}

struct ScreenSize {
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}
