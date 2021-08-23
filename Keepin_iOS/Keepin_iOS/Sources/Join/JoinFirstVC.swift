//
//  JoinFirstVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/06.
//

import UIKit

class JoinFirstVC: UIViewController {

    
    @IBOutlet var titleLabel: [UILabel]!
    @IBOutlet var warnLabel: [UILabel]!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pwOKTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet var underlineView: [UIView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setNavigationBar()
        
        idTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        pwOKTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    // MARK: - UI
    func setUI(){
        titleLabel[0].font = UIFont.GmarketSansTTF(.medium, size: 20)
        titleLabel[1].font = UIFont.GmarketSansTTF(.medium, size: 16)
        titleLabel[2].font = UIFont.GmarketSansTTF(.medium, size: 16)
        titleLabel[3].font = UIFont.GmarketSansTTF(.medium, size: 16)
        
        idTextField.font = UIFont.NotoSans(.regular, size: 16)
        pwTextField.font = UIFont.NotoSans(.regular, size: 16)
        pwOKTextField.font = UIFont.NotoSans(.regular, size: 16)
        
        underlineView[0].backgroundColor = .keepinGray3
        underlineView[1].backgroundColor = .keepinGray3
        underlineView[2].backgroundColor = .keepinGray3
        
        nextButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 16)
        nextButton.tintColor = .keepinGray3
        
        warnLabelUI(label: warnLabel[0])
        warnLabelUI(label: warnLabel[1])
        warnLabelUI(label: warnLabel[2])
        
    }
    
    func warnLabelUI(label : UILabel){
        label.isHidden = true
        label.font = UIFont.NotoSans(.regular, size: 14)
        label.textColor = UIColor.salmon
    }
    
    func setNavigationBar(){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Server Connect
    func serverConnect(email: String){
        let joinEmailCheckRequest = JoinEmailRequest(email: email)
        JoinDataManager().postEmailCheck(joinEmailCheckRequest, viewController: self)
    }
    
    
    // MARK: - objc func
    @objc func textFieldDidChange(_ sender: Any?) {

        if idTextField.text != "" {
            underlineView[0].backgroundColor = .keepinBlack
        }
        else if idTextField.text == "" {
            underlineView[0].backgroundColor = .keepinGray3
        }
        
        if pwTextField.text != "" {
            underlineView[1].backgroundColor = .keepinBlack
        }
        else if idTextField.text == "" {
            underlineView[1].backgroundColor = .keepinGray3
        }
        
        if pwOKTextField.text != "" {
            underlineView[2].backgroundColor = .keepinBlack
        }
        else if pwOKTextField.text == "" {
            underlineView[2].backgroundColor = .keepinGray3
        }
        
        if idTextField.text != "" && pwTextField.text != "" && pwOKTextField.text != "" {
            nextButton.tintColor = .keepinGreen
            
        }
        
        
        if idTextField.text!.contains("@") && idTextField.text!.contains(".") {
            warnLabel[0].isHidden = true
        }
        else if idTextField.text == "" {
            warnLabel[0].isHidden = true
        }
        else {
            warnLabel[0].isHidden = false
        }
        
        if pwTextField.text!.validatePassword() == true || pwTextField.text == "" {
            warnLabel[1].isHidden = true
        }
        else {
            warnLabel[1].isHidden = false
        }
        
        
        if (pwTextField.text != "" && pwOKTextField.text != "") {
            if pwTextField.text != pwOKTextField.text {
                warnLabel[2].isHidden = false
            }
            else {
                warnLabel[2].isHidden = true
            }
        
        }
        
    }
    
    // MARK: - IBAction
    @IBAction func backButtonClicked(_ sender: Any) {
        // 이전화면 버튼 눌렀을 때
        print("이전화면으로 돌아가는 버튼")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        // 다음 버튼 눌렀을 때
        serverConnect(email: idTextField.text!)
    }
}

extension String {
    // E-mail address validation
        public func validateEmail() -> Bool {
            let emailRegEx = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
            
            let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return predicate.evaluate(with: self)
        }
        
        // Password validation
        public func validatePassword() -> Bool {
            let passwordRegEx = "^(?=.*[0-9])(?=.*[a-z]).{8,16}$"
            
            let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
            return predicate.evaluate(with: self)
        }
}

// MARK:- JoinFirstVC Server Extension
extension JoinFirstVC {
    
    func didSuccessJoinEmailCheck(message: String, code: Int) {
        if code == 200 {
            self.navigationController?.pushViewController(JoinSecondVC(), animated: true)
        }
        else if code == 400 {
            self.makeAlertOnlyMessage(message: message, okAction: nil)
        }
    }
    
    func failedToRequest(message: String) {
        print(message)
    }
}

