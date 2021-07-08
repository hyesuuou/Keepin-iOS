//
//  JoinSecondVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/06.
//

import UIKit

class JoinSecondVC: UIViewController {

    @IBOutlet var titleLabel: [UILabel]!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet var underlineView: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setNavigationBarUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI(){
        titleLabel[0].font = UIFont.GmarketSansTTF(.medium, size: 20)
        titleLabel[1].font = UIFont.GmarketSansTTF(.medium, size: 16)
        titleLabel[2].font = UIFont.GmarketSansTTF(.medium, size: 16)
        titleLabel[3].font = UIFont.GmarketSansTTF(.medium, size: 16)
        
        underlineView[0].backgroundColor = .keepinGray3
        underlineView[1].backgroundColor = .keepinGray3
        underlineView[2].backgroundColor = .keepinGray3
        
        nameTextField.font = UIFont.NotoSans(.regular, size: 16)
        birthTextField.font = UIFont.NotoSans(.regular, size: 16)
        phoneTextField.font = UIFont.NotoSans(.regular, size: 16)
        
    }
    
    func setNavigationBarUI(){
        self.navigationController?.navigationBar.isHidden = true
        
        doneButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 16)
        doneButton.tintColor = .keepinGray3
    }


}
