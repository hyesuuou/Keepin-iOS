//
//  KeepinPlusFriendVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/10.
//

import UIKit

class KeepinPlusFriendVC: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var warnLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.textColor = UIColor.keepinBlack
        mainLabel.font = UIFont.GmarketSansTTF(.medium, size: 16)
        
        doneButton.tintColor = .keepinGray3
        doneButton.titleLabel?.font = .NotoSans(.bold, size: 16)
        
        lineView.backgroundColor = .keepinGray3
        
        textField.attributedPlaceholder = NSAttributedString(string: "등록할 이름을 입력해 주세요.(최대 5자)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.keepinGray3])
        textField.addTarget(self, action: #selector(textFieldChange(_sender:)), for: .editingChanged)
        setWarnLabel(label: warnLabel)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func textFieldChange(_sender: Any?){
        if textField.text != ""{
            doneButton.tintColor = .keepinGreen
        }
        //if textField.text
    }
    
    func setWarnLabel(label:UILabel){
        label.isHidden = true
        label.font = UIFont.NotoSans(.regular, size: 14)
        label.textColor = .salmon
    }

    @IBAction func toBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
