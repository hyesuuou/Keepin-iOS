//
//  KeepinPlusCategoryTVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/10.
//

import UIKit

class KeepinPlusCategoryTVC: UITableViewCell {
    
    // 선택된 경우 -> 1, 선택x -> 0
    public static var numberList : [Int] = [0, 0, 0, 0, 0, 0, 0, 0]
    
    public static let identifier = "KeepinPlusCategoryTVC"
    
    @IBOutlet var button: [UIButton]!
    override func awakeFromNib() {
        super.awakeFromNib()
        //setButtonUI(select: KeepinPlusCategoryTVC.numberList)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
 
    
    func setButtonUI(select : [Int]){
        
        for i in 0 ... 7 {
            if select[i] == 1 {
                button[i].tintColor = .white
                button[i].backgroundColor = .keepinGreen
                button[i].layer.borderWidth = 0
            }
            else {
                button[i].tintColor = .keepinGray3
                button[i].backgroundColor = .white
                button[i].layer.borderWidth = 1
                button[i].layer.borderColor = UIColor.keepinGray3.cgColor
            }
            button[i].layer.cornerRadius = 15
            button[i].titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
            
            
        }
        
    }
    
}



