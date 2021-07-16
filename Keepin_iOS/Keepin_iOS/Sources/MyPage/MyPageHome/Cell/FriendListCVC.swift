//
//  FriendListCVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/10.
//

import UIKit

class FriendListCVC: UICollectionViewCell {

    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var moveButton: UIButton!
    @IBOutlet weak var touchButton: UIButton!
    
    static let identifier : String = "FriendListCVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 12
        
        friendName.font = UIFont.GmarketSansTTF(.medium, size: 16)
        friendName.textColor = .keepinBlack
    
    }
    func setData(title: String){
        friendName.text = title
    }

    
}
