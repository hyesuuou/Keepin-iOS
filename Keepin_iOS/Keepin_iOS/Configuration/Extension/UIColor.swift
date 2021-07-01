//
//  UIColor.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import Foundation
import UIKit

extension UIColor {
    // MARK: hex code를 이용하여 정의
    // ex. UIColor(hex: 0xF5663F)
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    // MARK: 메인 테마 색 또는 자주 쓰는 색을 정의
    // ex. label.textColor = .mainOrange
    //ex. class var mainPurple: UIColor { UIColor(hex: 0x5f0080) }
    
    @nonobjc class var keepinBlack: UIColor {
       return UIColor(white: 52.0 / 255.0, alpha: 1.0)
     }

     @nonobjc class var keepinGray: UIColor {
       return UIColor(red: 243.0 / 255.0, green: 245.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)
     }

     @nonobjc class var keepinGray3: UIColor {
       return UIColor(white: 204.0 / 255.0, alpha: 1.0)
     }

     @nonobjc class var keepinGray4: UIColor {
       return UIColor(white: 165.0 / 255.0, alpha: 1.0)
     }

     @nonobjc class var keepinGray2: UIColor {
       return UIColor(white: 230.0 / 255.0, alpha: 1.0)
     }

     @nonobjc class var keepinGreen: UIColor {
       return UIColor(red: 21.0 / 255.0, green: 189.0 / 255.0, blue: 111.0 / 255.0, alpha: 1.0)
     }

     @nonobjc class var keepinGray1: UIColor {
       return UIColor(white: 249.0 / 255.0, alpha: 1.0)
     }

     @nonobjc class var keepinGray5: UIColor {
       return UIColor(white: 87.0 / 255.0, alpha: 1.0)
     }

     @nonobjc class var seaweed: UIColor {
       return UIColor(red: 21.0 / 255.0, green: 189.0 / 255.0, blue: 111.0 / 255.0, alpha: 1.0)
     }
    
    @nonobjc class var keepinGray250: UIColor {
      return UIColor(white: 230.0 / 255.0, alpha: 0.5)
    }
    
    @nonobjc class var black20: UIColor {
       return UIColor(white: 0.0, alpha: 0.2)
     }
    
    @nonobjc class var ice: UIColor {
      return UIColor(red: 217.0 / 255.0, green: 245.0 / 255.0, blue: 232.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var salmon: UIColor {
      return UIColor(red: 241.0 / 255.0, green: 114.0 / 255.0, blue: 114.0 / 255.0, alpha: 1.0)
    }
}
