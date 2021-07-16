//
//  MyPageFriendFixVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/09.
//

import UIKit

class MyPageFriendFixVC: UIViewController {
    
    @IBOutlet weak var friendLabel: UILabel!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setNavigationBar()
    }
    
    func setStyle(){
        friendLabel.text = "친구의 이름을 입력해 주세요."
        friendLabel.textColor = .keepinBlack
        friendLabel.font  = UIFont.GmarketSansTTF(.medium, size: 16)

        textView.backgroundColor = .keepinBlack
    }
    
    func setNavigationBar(){
        let backButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        backButton.setImage(UIImage(named: "icBack"),for: UIControl.State.normal)
        backButton.addTarget(self, action: #selector(toBack), for: UIControl.Event.touchUpInside)
        backButton.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        
        
        let registerButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        registerButton.setTitle("등록하기", for: UIControl.State.normal)
        registerButton.setTitleColor(.keepinGreen, for: UIControl.State.normal)
        registerButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 16)
        registerButton.frame = CGRect(x: 0, y: 0, width: 24, height: 49)
        
        let backbarButton = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backbarButton
        
        let registerbarButton = UIBarButtonItem(customView: registerButton)
        self.navigationItem.rightBarButtonItem = registerbarButton
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc func toBack(){
        self.navigationController?.popViewController(animated: true)
    }

}
