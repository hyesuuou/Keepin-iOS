//
//  Date.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/10.
//

import Foundation
import UIKit

extension Date {
    func toString(format: String = "yyyy.MM.dd") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

