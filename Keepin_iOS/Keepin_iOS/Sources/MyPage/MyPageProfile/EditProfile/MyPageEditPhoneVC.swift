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
        
        setStyle()
        setTarget()
    }
    
    func setStyle(){
        phoneLabel.font = UIFont.NotoSans(.regular, size: 16)

        doneButton.tintColor = .keepinGray3
        doneButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 16)
    }
    
    func setTarget(){
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
    
    
    @IBAction func doneButton(_ sender: Any) {
        let request = MyPageProfilePhoneRequest(phone: textField.text!)
        MyPageProfileDataManager().fixProfilePhone(modified: request, viewcontroller: self)
    }
    
}


extension MyPageEditPhoneVC{
    func didSuccessFixPhone(messasge: String){
        print(messasge)
    }
    
}
