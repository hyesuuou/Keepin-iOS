//
//  UISwitch.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/11.
//

import Foundation
import UIKit

extension UISwitch {

    func set(width: CGFloat, height: CGFloat) {

        let standardHeight: CGFloat = 31
        let standardWidth: CGFloat = 51

        let heightRatio = height / standardHeight
        let widthRatio = width / standardWidth

        transform = CGAffineTransform(scaleX: widthRatio, y: heightRatio)
    }
}
