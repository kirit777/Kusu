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

struct DeviceType {
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPHONE_X          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
    static let IS_IPHONE_X_series   = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH >= 812.0
}


func getBaseURL(strName:String ) -> String {
    return String(format: "%@/%@", String.Base_url , strName)
}


func GetHeader() -> [String:String]{
    let headers = ["version" : "1.0.0"] // "content-type" : "application/x-www-form-urlencoded" ,
    return headers
}

extension UIDevice {
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    
    var iOSVersion:String {
        var systemVersion = ""
        systemVersion = UIDevice.current.systemVersion
        return systemVersion
    }
}

func GetHeaderWithAuthor() -> NSDictionary {
    let dict = NSMutableDictionary()
   
    dict["state"] = ""
    dict["token"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2Njg0MjYzMTEsImlzcyI6ImxvY2FsaG9zdCIsImV4cCI6MTY5OTk2MjMxMSwidXNlcl9pZCI6IjE0In0.8Nib4mAwD5WrQn23B0HM6en2pBsXTT0l6TAjzq4WSfA"
    
    
    
    dict["os_version"] = UIDevice.current.iOSVersion
    dict["device_model"] = UIDevice.current.modelName
    dict["version"] = "1.0.0"
    dict["device_type"] = "mobile"
    dict["in_app"] = "1"
    dict["device_os"] = "iOS"
    dict["content-type"] = "application/x-www-form-urlencoded"
    dict["latitude"] = ""
    dict["longitude"] = ""
    dict["address"] = ""
    dict["city"] = ""
    dict["zip_code"] = ""
    dict["state"] = ""
    dict["country"] = ""
    dict["session_id"] = "4aede73f9d60825529d758b43761e2a3"
    dict["internet_ip"] = "106.222.70.181"
    
    
    return dict
}
