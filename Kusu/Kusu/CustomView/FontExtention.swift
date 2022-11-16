//
//  FontExtention.swift
//  Kusu
//
//  Created by Kirit on 16/11/22.
//

import Foundation
import UIKit

//MARK:- ASFont
enum SAFont: String {
    
    case PlayfairDisplay_Black = "PlayfairDisplay-Black"
    case PlayfairDisplay_BlackItalic = "PlayfairDisplay-BlackItalic"
    case PlayfairDisplay_Bold = "PlayfairDisplay-Bold"
    case PlayfairDisplay_BoldItalic = "PlayfairDisplay-BoldItalic"
    case PlayfairDisplay_ExtraBold = "PlayfairDisplay-ExtraBold"
    case PlayfairDisplay_ExtraBoldItalic = "PlayfairDisplay-ExtraBoldItalic"
    case PlayfairDisplay_Italic = "PlayfairDisplay-Italic"
    case PlayfairDisplay_Medium = "PlayfairDisplay-Medium"
    case PlayfairDisplay_MediumItalic = "PlayfairDisplay-MediumItalic"
    case PlayfairDisplay_Regular = "PlayfairDisplay-Regular"
    case PlayfairDisplay_SemiBold = "PlayfairDisplay-SemiBold"
    case PlayfairDisplay_SemiBoldItalic = "PlayfairDisplay-SemiBoldItalic"
    
}

//MARK:- Other Methods
extension SAFont {
    func of(_ size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}

extension UIFont {
    static func PlayfairDisplay_Black(size:CGFloat) -> UIFont {
        return UIFont(name: "PlayfairDisplay-Black", size: size)!
    }
    
    static func PlayfairDisplay_BlackItalic(size:CGFloat) -> UIFont {
        return UIFont(name: "PlayfairDisplay-BlackItalic", size: size)!
    }
    
    static func PlayfairDisplay_Bold(size:CGFloat) -> UIFont {
        return UIFont(name: "PlayfairDisplay-Bold", size: size)!
    }
    
    static func PlayfairDisplay_BoldItalic(size:CGFloat) -> UIFont {
        return UIFont(name: "PlayfairDisplay-BoldItalic", size: size)!
    }
    
    static func PlayfairDisplay_ExtraBold(size:CGFloat) -> UIFont {
        return UIFont(name: "PlayfairDisplay-ExtraBold", size: size)!
    }
    
    static func PlayfairDisplay_ExtraBoldItalic(size:CGFloat) -> UIFont {
        return UIFont(name: "PlayfairDisplay-ExtraBoldItalic", size: size)!
    }
    
    static func PlayfairDisplay_Italic(size:CGFloat) -> UIFont {
        return UIFont(name: "PlayfairDisplay-Italic", size: size)!
    }
    
    static func PlayfairDisplay_Medium(size:CGFloat) -> UIFont {
        return UIFont(name: "PlayfairDisplay-Medium", size: size)!
    }
    
    static func PlayfairDisplay_MediumItalic(size:CGFloat) -> UIFont {
        return UIFont(name: "PlayfairDisplay-MediumItalic", size: size)!
    }
    
    static func PlayfairDisplay_Regular(size:CGFloat) -> UIFont {
        return UIFont(name: "PlayfairDisplay-Regular", size: size)!
    }
    
    static func PlayfairDisplay_SemiBold(size:CGFloat) -> UIFont {
        return UIFont(name: "PlayfairDisplay-SemiBold", size: size)!
    }
    
    static func PlayfairDisplay_SemiBoldItalic(size:CGFloat) -> UIFont {
        return UIFont(name: "PlayfairDisplay-SemiBoldItalic", size: size)!
    }
    
}
