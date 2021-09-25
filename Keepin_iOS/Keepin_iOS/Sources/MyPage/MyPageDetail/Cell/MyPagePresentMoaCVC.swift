//
//  MyPagePresentMoaCVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/08/23.
//

import UIKit

class MyPagePresentMoaCVC: UICollectionViewCell {
    

    @IBOutlet weak var presentImage: UIImageView!
    @IBOutlet weak var presentTitle: UILabel!
    @IBOutlet weak var presentData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setStyle()
        prepareForReuse()
    }
    
    func setStyle(){
        presentImage.backgroundColor = .keepinGray
        presentTitle.font = UIFont.GmarketSansTTF(.medium, size: 14)
        presentTitle.textColor = UIColor.keepinGray5
        presentData.font = UIFont.NotoSans(.regular, size: 12)
        presentData.textColor = UIColor.keepinGray4
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "MyPagePresentMoaCVC", bundle: nil)
    }
    
    override func prepareForReuse() {
        presentImage.image = nil
        presentTitle.text = nil
        presentData.text = nil
    }
    
}
