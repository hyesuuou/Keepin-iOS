//
//  UITextField.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/20.
//

import Foundation
import UIKit

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12.9, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func setDatePicker(target: Any) {
        let SCwidth = self.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: SCwidth, height: 216))
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.addTarget(self, action: #selector(onDatePickerValueChanged), for: .valueChanged)
        self.inputView = datePicker
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: SCwidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "취소", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "완료", style: .plain, target: target, action: #selector(doneButtonClicked))
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
        
    }
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
    @objc
    func doneButtonClicked(){
        self.resignFirstResponder()
    }
    
    @objc
    func onDatePickerValueChanged(datePicker: UIDatePicker){
        self.text = datePicker.date.toString()
    }
}
