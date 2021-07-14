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
    
    // MARK: UIWindow의 rootViewController를 변경하여 화면전환
    func changeRootViewController(_ viewControllerToPresent: UIViewController) {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = viewControllerToPresent
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
        } else {
            viewControllerToPresent.modalPresentationStyle = .overFullScreen
            self.present(viewControllerToPresent, animated: true, completion: nil)
        }
    }
    
    // MARK: 세미나에서 긁어온 extension
    func makeRequestAlert(title : String,
                       message : String,
                       okAction : ((UIAlertAction) -> Void)?,
                       cancelAction : ((UIAlertAction) -> Void)? = nil,
                       completion : (() -> Void)? = nil)
        {
            
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
            let alertViewController = UIAlertController(title: title, message: message,
                                                        preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
            alertViewController.addAction(okAction)
            
            
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: cancelAction)
            alertViewController.addAction(cancelAction)
            

            self.present(alertViewController, animated: true, completion: completion)
        }
    
    func makeAlert(title : String,
                       message : String,
                       okAction : ((UIAlertAction) -> Void)? = nil,
                       completion : (() -> Void)? = nil)
        {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
            let alertViewController = UIAlertController(title: title, message: message,
                                                        preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
            alertViewController.addAction(okAction)
            
            
            self.present(alertViewController, animated: true, completion: completion)
        }
    
    // MARK: Message와 확인버튼만 있는 UIAlertController
    func makeAlertOnlyMessage(message : String, okAction : ((UIAlertAction) -> Void)?, completion : (() -> Void)? = nil){
        let alertViewController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true, completion: completion)
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
    
    // MARK: 밑에서 datePicker 팝업
    func setDatePicker(selector: Selector){
        let tempInput = UITextField( frame:CGRect.zero )
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.addTarget(self, action: selector , for: UIControl.Event.valueChanged)
        
        tempInput.inputView = datePicker
        self.view.addSubview( tempInput )

        tempInput.becomeFirstResponder()
    }
    /*
      // MARK:밑에서 datePicker 팝업 사용법
        parameter에 들어가는 selector은 이 datePicker의 값을 가지고 바꿔야 하는 부분에 사용한다!
     
     ex:     //데이트피커 실시간 반영 selector
     @objc func onDatePickerValueChanged(datePicker: UIDatePicker) {
         dateLabel.text = datePicker.date.toString()
     }
     
     (이건 이름은 그대로 놔두고 안에 내용만 바꾸면서 사용하면 될듯)
     
     이렇게 하면 이 setDatePicker을 사용하고 싶을때
     self.setDatePicker(selector: #selector(onDatePickerValueChanged))
     이렇게 해주면 되겠지요?!
     
     */
}
