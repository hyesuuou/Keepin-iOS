//
//  PresendMoaCVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/02.
//

import UIKit

class PresentMoaCVC: UICollectionViewCell {

    @IBOutlet weak var presentImage: UIImageView!
    @IBOutlet weak var presentTitle: UILabel!
    @IBOutlet weak var presentDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        presentImage.backgroundColor = .keepinGray
        presentTitle.textColor = .keepinGray5
        presentDate.textColor = .keepinGray4
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "PresentMoaCVC", bundle: nil)
    }

}
