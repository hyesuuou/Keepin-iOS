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
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    var friendName: String = ""
    var id: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        self.dismissKeyboardWhenTappedAround()
    }
 

    func setStyle(){
        friendLabel.text = "친구의 이름을 입력해 주세요."
        friendLabel.textColor = .keepinBlack
        friendLabel.font  = UIFont.GmarketSansTTF(.medium, size: 16)

        textView.backgroundColor = .keepinBlack
        doneButton.tintColor = .keepinGray3
        doneButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 16)
        
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textField.text = friendName
    }
    
    @objc func textFieldDidChange(_ sender: Any){
        if textField.text != ""{
            doneButton.tintColor = .keepinGreen
        }
    }
    
    
    @IBAction func toBack(_ sender: Any) {
            self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func doneButton(_ sender: Any) {
        let request = MyPageFixRequest(name: textField.text!)
        MyPageDetailDataManager().fixFriendName(id, modified: request, viewController: self)
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension MyPageFriendFixVC{
    func didsuccessFixFriendName(message: String){
        print(message)
    }
}
