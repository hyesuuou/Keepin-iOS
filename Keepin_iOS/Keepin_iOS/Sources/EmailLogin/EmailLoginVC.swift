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
        setUI()
        self.dismissKeyboardWhenTappedAround()
    }
    
    func setUI(){
        setNavigationBarUI()
        
        // 초기 로그인버튼 UI
        loginButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 14)
        loginButton.backgroundColor = .keepinGray1
        loginButton.tintColor = .keepinGray3
        loginButton.layer.cornerRadius = 26
        
        // 초기 textfield UI
        setTextFieldUI(tf: idTextField)
        setTextFieldUI(tf: pwTextField)
        
        // textfield 값 변경에 따른 UI
        idTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func setNavigationBarUI(){
        self.navigationController?.navigationBar.isHidden = true
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

// MARK:- EmailLoginVC Server
extension EmailLoginVC {
    
    func didSuccessLogin(message: String, code: Int, token: String) {
        if code == 200 {
            print("로그인 성공")
            UserDefaults.standard.setValue(token, forKey: "jwt")
            Constant.HEADER = ["Content-Type": "application/json",
                              "jwt" : UserDefaults.standard.value(forKey: "jwt") as! String]
            self.navigationController?.changeRootViewController(BaseTBC())
        }
        else if code == 400 {
            self.makeAlertOnlyMessage(message: "이메일/비밀번호를 다시 확인해주세요.", okAction: nil)
        }
        else if code == 401 {
            print("리프레시 토큰 요청 필요")
        }
    }
    
    func failedToRequest(message: String) {
        print(message)
    }
}
