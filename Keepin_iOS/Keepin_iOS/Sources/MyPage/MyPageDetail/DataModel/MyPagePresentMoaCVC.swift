//
//  MyPagePresentMoaCVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/21.
//

import UIKit

class MyPagePresentMoaCVC: UICollectionViewCell {
    
    //static let identifier = "MyPagePresentMoaCVC"
    
    @IBOutlet weak var presentImage: UIImageView!
    @IBOutlet weak var presentTitle: UILabel!
    @IBOutlet weak var presentData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        setStyle()
        prepareForReuse()
    }
    
    func setStyle(){
        //presentTitle.text = "학교에서 다이어리 받음"
        presentTitle.font = UIFont.GmarketSansTTF(.medium, size: 14)
        //presentTitle.textColor = UIColor.keepinGray5
        presentTitle.textColor = UIColor.keepinBlack
        //presentData.text = "2021.06.27"
        presentData.font = UIFont.NotoSans(.regular, size: 12)
        //presentData.textColor = UIColor.keepinGray4
        presentData.textColor = UIColor.keepinBlack
        /*
        if let image = UIImage(named: "image36"){
            presentImage.image = image
        }*/
       
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
