//
//  MyPageHomeHeaderCVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/09.
//

import UIKit

class MyPageHomeHeaderCVC: UICollectionViewCell {
    
    static let identifier : String = "MyPageHomeHeaderCVC"
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainText.text = "친구 모아보기"
        mainText.font = UIFont.GmarketSansTTF(.medium, size: 18)
        mainText.textColor = .keepinBlack
        
        mainView.backgroundColor = .keepinGray
    
    }

}
