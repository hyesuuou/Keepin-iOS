//
//  PresentDetailCVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/06.
//

import UIKit

class PresentDetailCVC: UICollectionViewCell {

    @IBOutlet weak var presentImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib{
        return UINib(nibName: "PresentDetailCVC", bundle: nil)
    }
    
}
