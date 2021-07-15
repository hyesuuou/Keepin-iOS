//
//  LoginFirstVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/05.
//

import UIKit

class LoginFirstVC: UIViewController {
    
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width

    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var kakaoLoginButton: UIButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    @IBOutlet weak var joinButton: UIButton!
    @IBOutlet weak var joinLabel: UILabel!
    
    @IBOutlet weak var imageTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var imageBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var joinLeftConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonUI()
        setLabelUI()
        setNavigationBarUI()
        setLayout()
    }
    
    
    func setLayout(){
        
        
        imageTopConstraint.constant = screenHeight * (158/812)
        
        if screenHeight == 667.0 {
            imageBottomConstraint.constant = screenHeight * (150/812)
        }
        else {
            imageBottomConstraint.constant = screenHeight * (180/812)
        }
        //buttonBottomConstraint.constant = screenHeight * (40/812)
        
        //joinLeftConstraint.constant = screenWidth * (99/375)
    }
    
    
    func setButtonUI(){
        loginButtonUI(button: emailLoginButton)
        loginButtonUI(button: kakaoLoginButton)
        loginButtonUI(button: appleLoginButton)
        
        // 회원가입버튼
        joinButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 12)
        joinButton.tintColor = .keepinGreen
    }
    
    func loginButtonUI(button: UIButton){
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.keepinBlack.cgColor
        button.layer.cornerRadius = 24
        button.titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
        button.titleLabel?.textAlignment = .center
        
    
    }
    
    func setLabelUI(){
        joinLabel.font = UIFont.NotoSans(.regular, size: 12)
        joinLabel.textColor = .keepinGray4
    }
    
    func setNavigationBarUI(){
        self.navigationController?.navigationBar.isHidden = true
    }
    

    @IBAction func emailLoginButtonClicked(_ sender: Any) {
        // 이메일 로그인 화면으로 전환
        print("이메일 로그인으로 화면전환")
        self.navigationController?.pushViewController(EmailLoginVC(), animated: true)
    }
    
    @IBAction func joinButtonClicked(_ sender: Any) {
        // 회원가입 화면으로 전환
        print("회원가입 화면으로 전환")
        self.navigationController?.pushViewController(JoinFirstVC(), animated: true)
    }
}
