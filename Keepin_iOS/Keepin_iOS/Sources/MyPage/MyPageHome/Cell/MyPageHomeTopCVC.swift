//
//  MyPageHomeTopCVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/09.
//

import UIKit

class MyPageHomeTopCVC: UICollectionViewCell {
    
    static let identifier : String = "MyPageHomeTopCVC"
    let name : String = "박윤정"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var presentView: UIView!
    
    @IBOutlet weak var stackView: UIView!
    @IBOutlet weak var stackView2: UIView!
    
    @IBOutlet weak var present1: UILabel!
    @IBOutlet weak var present2: UILabel!
    @IBOutlet weak var present3: UILabel!
    
    @IBOutlet weak var num1: UILabel!
    @IBOutlet weak var num2: UILabel!
    @IBOutlet weak var num3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        nameLabel.text = "\(name) 님"
        nameLabel.font = UIFont.GmarketSansTTF(.medium, size: 20)
        nameLabel.textColor = UIColor.keepinBlack
        
        let attributedStr = NSMutableAttributedString(string: nameLabel.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.keepinGreen, range:(nameLabel.text! as NSString).range(of: "\(name)"))
        nameLabel.attributedText = attributedStr
        
        presentView.backgroundColor = .keepinGray
        presentView.layer.cornerRadius = 12
        
        stackView.backgroundColor = .keepinGray4
        stackView2.backgroundColor = .keepinGray4
        
        present1.text = "총 선물"
        present1.font = UIFont.NotoSans(.regular, size: 14)
        present1.textColor = UIColor.keepinGray5
        num1.text = "2개"
        num1.font = UIFont.NotoSans(.bold, size: 16)
        num1.textColor = UIColor.keepinGreen
        
        present2.text = "받은 선물"
        present2.font = UIFont.NotoSans(.regular, size: 14)
        present2.textColor = UIColor.keepinGray5
        num2.text = "1개"
        num2.font = UIFont.NotoSans(.bold, size: 16)
        num2.textColor = UIColor.keepinGreen
        
        present3.text = "준 선물"
        present3.font = UIFont.NotoSans(.regular, size: 14)
        present3.textColor = UIColor.keepinGray5
        num3.text = "1개"
        num3.font = UIFont.NotoSans(.bold, size: 16)
        num3.textColor = UIColor.keepinGreen
        
    }
    
    
}
