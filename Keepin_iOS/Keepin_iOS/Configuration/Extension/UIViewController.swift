//
//  UIViewController.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import Foundation
import UIKit

extension UIViewController {
    // MARK: 빈 화면을 눌렀을 때 키보드가 내려가도록 처리
    func dismissKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer =
            UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    // MARK: 취소와 확인이 뜨는 UIAlertController
    func presentAlert(title: String, message: String? = nil,
                      isCancelActionIncluded: Bool = false,
                      preferredStyle style: UIAlertController.Style = .alert,
                      handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let actionDone = UIAlertAction(title: "확인", style: .default, handler: handler)
        alert.addAction(actionDone)
        if isCancelActionIncluded {
            let actionCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            alert.addAction(actionCancel)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: 커스텀 UIAction이 뜨는 UIAlertController
    func presentAlert(title: String, message: String? = nil,
                      isCancelActionIncluded: Bool = false,
                      preferredStyle style: UIAlertController.Style = .alert,
                      with actions: UIAlertAction ...) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { alert.addAction($0) }
        if isCancelActionIncluded {
            let actionCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            alert.addAction(actionCancel)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
        // MARK: 제목만 있는 경고창 쓰는 방법
        // 제목과 확인 버튼만 있음 (확인 버튼 누르면 아무일도 일어나지 않음)
        @IBAction func presentAlert(_ sender: UIButton) {
            self.presentAlert(title: "제목만 있는 경고창")
        }
     
        // MARK: 취소가 있는 경고창 쓰는 방법
        / 제목과 취소,확인 버튼 있음 (확인 버튼 누르면 아무일도 일어나지 않음)
        @IBAction func presentAlertWithCancel(_ sender: UIButton) {
            self.presentAlert(title: "취소가 있는 경고창", isCancelActionIncluded: true)
        }
     
        // MARK: 확인에 completion이 있는 경고창 쓰는 방법
        // 제목과 취소,확인 버튼 있음 (확인 버튼 누르면 특정 액션 주게 할 수 있음)
        @IBAction func presentAlertWithCompletion(_ sender: UIButton) {
            self.presentAlert(title: "completion이 있는 경고창", message: "확인 버튼을 누르면 배경 색깔이 노랑색으로 바뀝니다", isCancelActionIncluded: true) { action in
                self.view.backgroundColor = .yellow
            }
        }
     
     */
    
    // MARK: 커스텀 UIAlertAction들이 있는 Action Sheet
    func presentAlert(message: String? = nil,
                      isCancelActionIncluded: Bool = false,
                      preferredStyle style: UIAlertController.Style = .alert,
                      with actions: UIAlertAction ...) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { alert.addAction($0) }
        if isCancelActionIncluded {
            let actionCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            alert.addAction(actionCancel)
        }
        self.present(alert, animated: true) {
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
                alert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }
    }
    
    @objc func dismissAlertController(){
        self.dismiss(animated: true, completion: nil)
    }
}
