//
//  KeppinPlusSelectTVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/10.
//

import UIKit

class KeppinPlusSelectTVC: UITableViewCell {
    
    public static let identifier = "KeppinPlusSelectTVC"
    
    // button[0]: 받은 선물, button[1]: 준 선물
    @IBOutlet var button: [UIButton]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setButtonUI(select : Int){
        
        // select가 0일 때 -> notSelect = 1-0 = 1
        // select가 1일 때 -> notSelect = 1-1 = 0
        let notSelect : Int = abs(1-select)
        
        // 선택된
        button[select].tintColor = .white
        button[select].backgroundColor = .keepinGreen
        button[select].layer.borderWidth = 0
        
        button[notSelect].tintColor = .keepinGray3
        button[notSelect].backgroundColor = .white
        button[notSelect].layer.borderWidth = 1
        button[notSelect].layer.borderColor = UIColor.keepinGray3.cgColor
        
        button[select].titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
        button[notSelect].titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
       
        
        button[select].layer.cornerRadius = 21.5
        button[notSelect].layer.cornerRadius = 21.5
        
    }
    

}
