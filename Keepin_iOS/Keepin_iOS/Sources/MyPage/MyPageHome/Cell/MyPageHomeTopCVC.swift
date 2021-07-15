//
//  MyPageHomeTopCVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/09.
//

import UIKit

class MyPageHomeTopCVC: UICollectionViewCell {
    
    static let identifier : String = "MyPageHomeTopCVC"
    var name : String = "박윤정"
    var c1 : Int = 0
    var c2 : Int = 0
    var c3 : Int = 0
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var presentView: UIView!
    
    @IBOutlet weak var stackView: UIView!
    @IBOutlet weak var stackView2: UIView!
    
    @IBOutlet weak var present1: UILabel!
    @IBOutlet weak var present1pad: NSLayoutConstraint!
    @IBOutlet weak var present2: UILabel!
    @IBOutlet weak var present3: UILabel!
    @IBOutlet weak var present3pad: NSLayoutConstraint!
    
    @IBOutlet weak var num1: UILabel!
    @IBOutlet weak var num2: UILabel!
    @IBOutlet weak var num3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        presentView.backgroundColor = .keepinGray
        presentView.layer.cornerRadius = 12
        
        stackView.backgroundColor = .keepinGray4
        stackView2.backgroundColor = .keepinGray4
        
        present1.text = "총 선물"
        present1.font = UIFont.NotoSans(.regular, size: 14)
        present1.textColor = UIColor.keepinGray5
        
        present2.text = "받은 선물"
        present2.font = UIFont.NotoSans(.regular, size: 14)
        present2.textColor = UIColor.keepinGray5
        
        present3.text = "준 선물"
        present3.font = UIFont.NotoSans(.regular, size: 14)
        present3.textColor = UIColor.keepinGray5
        
        setAuto()
        
    }
    
    func setAuto(){
        present1pad.constant = UIScreen.main.bounds.width * (36/375)
        present3pad.constant = UIScreen.main.bounds.width * (31.5/375)
    }
    
    
}
