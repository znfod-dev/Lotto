//
//  UIColor+Addons.swift
//  Lotto
//
//  Created by JongHyun Park on 2020/04/26.
//  Copyright © 2020 Znfod. All rights reserved.
//

import UIKit
extension UIColor {
    
    static func get1To10() -> UIColor {
        // 243 197 67
        return UIColor.init(red: 243/255, green: 197/255, blue: 67/255, alpha: 1.0)
    }
    static func get11To20() -> UIColor {
        // 128 198 238
        return UIColor.init(red: 128/255, green: 198/255, blue: 238/255, alpha: 1.0)
    }
    static func get21To30() -> UIColor {
        // 238 122 118
        return UIColor.init(red: 238/255, green: 122/255, blue: 118/255, alpha: 1.0)
    }
    static func get31To40() -> UIColor {
        // 170 170 170
        return UIColor.init(red: 170/255, green: 170/255, blue: 170/255, alpha: 1.0)
    }
    static func get41To45() -> UIColor {
        // 184 214 91
        return UIColor.init(red: 184/255, green: 214/255, blue: 91/255, alpha: 1.0)
    }
}

