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
    func yearOnly(format: String = "yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    func yearOnlyInt(format: String = "yyyy") -> Int {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return Int(formatter.string(from: self))!
    }
    func monthOnly(format: String = "MM") -> Int {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return Int(formatter.string(from: self))!
    }
}

