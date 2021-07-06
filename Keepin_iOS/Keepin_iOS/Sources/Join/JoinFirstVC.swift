//
//  JoinFirstVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/06.
//

import UIKit

class JoinFirstVC: UIViewController {

    
    @IBOutlet var titleLabel: [UILabel]!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pwOKTextField: UITextField!
    
    @IBOutlet var underlineView: [UIView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        idTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        pwOKTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
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
    }
    
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
    }


    

}
