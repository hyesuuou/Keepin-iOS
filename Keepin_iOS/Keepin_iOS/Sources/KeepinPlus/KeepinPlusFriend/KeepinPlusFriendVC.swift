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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.textColor = UIColor.keepinBlack
        mainLabel.font = UIFont.GmarketSansTTF(.medium, size: 16)
        
        lineView.backgroundColor = .keepinGray3
        
        textField.attributedPlaceholder = NSAttributedString(string: "등록할 이름을 입력해 주세요.(최대 5자)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.keepinGray3])
        

    }

}
