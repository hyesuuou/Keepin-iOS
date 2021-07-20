//
//  EmailLoginVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/05.
//

import UIKit

class EmailLoginVC: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        
        loginButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 14)
        loginButton.backgroundColor = .keepinGray1
        loginButton.tintColor = .keepinGray3
        loginButton.layer.cornerRadius = 26
        
        setTextFieldUI(tf: idTextField)
        setTextFieldUI(tf: pwTextField)
        
        idTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
        
    }
    
    func serverConnect(email: String, password: String){
        
        let emailLoginRequest = EmailLoginRequest(email: email, password: password)
        EmailLoginDataManager().postSignIn(emailLoginRequest, viewController: self)
    }

    func setTextFieldUI(tf : UITextField){
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.keepinGray3.cgColor
        tf.layer.cornerRadius = 12
        tf.addLeftPadding()
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        // TextField 값 변경 감지
        if idTextField.text != "" && pwTextField.text != "" {
            loginButton.backgroundColor = .keepinGreen
            loginButton.tintColor = .white
        }
        else {
            loginButton.backgroundColor = .keepinGray1
            loginButton.tintColor = .keepinGray3
        }
        
    }

    @IBAction func loginButtonClicked(_ sender: Any) {
        serverConnect(email: idTextField.text!, password: pwTextField.text!)
    }
    

}




extension EmailLoginVC {
    func didSuccessLogin(message: String, code: Int) {
        if code == 200 {
            self.navigationController?.changeRootViewController(BaseTBC())
        }
        else if code == 400 {
            self.makeAlertOnlyMessage(message: "이메일/비밀번호를 다시 확인해주세요.", okAction: nil)
        }
        
    }
    
    func failedToRequest(message: String) {
        print(message)
    }
}
