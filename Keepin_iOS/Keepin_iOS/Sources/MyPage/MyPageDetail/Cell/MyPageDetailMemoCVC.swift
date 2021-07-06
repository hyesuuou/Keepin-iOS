//
//  MyPageDetailMemoCVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/05.
//

import UIKit

class MyPageDetailMemoCVC: UICollectionViewCell {
    
    @IBOutlet weak var presentMoaCV: UICollectionView!
    
    
    @IBOutlet weak var got: UIButton!
    @IBOutlet weak var gave: UIButton!
    
    
    public static let identifier = "MyPageDetailMemoCVC"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        presentMoaCV.backgroundColor = .keepinGray
    }

}
