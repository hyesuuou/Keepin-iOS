//
//  MyPageEditPhoneVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/11.
//

import UIKit

class MyPageEditPhoneVC: UIViewController {

    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneLabel.font = UIFont.NotoSans(.regular, size: 16)

        doneButton.tintColor = .keepinGray3
        doneButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 16)
        
        textField.addTarget(self, action: #selector(textFieldDidChange(_sender:)), for: .editingChanged)
    }

    @IBAction func toBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @objc func textFieldDidChange(_sender: Any?){
        if textField.text != ""{
            doneButton.tintColor = .keepinGreen
        }
    }
    
}
