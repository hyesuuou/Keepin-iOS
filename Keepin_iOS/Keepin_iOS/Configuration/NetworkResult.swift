//
//  NetworkResult.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/17.
//


import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
