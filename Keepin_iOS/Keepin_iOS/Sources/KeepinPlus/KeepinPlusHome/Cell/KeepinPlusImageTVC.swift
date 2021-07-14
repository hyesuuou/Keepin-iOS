//
//  KeepinPlusImageTVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/10.
//

import UIKit

class KeepinPlusImageTVC: UITableViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public static let identifier = "KeepinPlusImageTVC"

    @IBOutlet var realImageView: [UIImageView]!
    
    
    @IBOutlet var imageContainerView: [UIView]!
    
    @IBOutlet var imagePlusButton: [UIButton]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageContainerView[0].isHidden = true
        imageContainerView[1].isHidden = true
        imageContainerView[2].isHidden = true
        // Initialization code
        setButtonUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage(image: UIImage, tag: Int){
        imageContainerView[tag].isHidden = false
        realImageView[tag].image = image
    }
    
    func setButtonUI(){
        imagePlusButton[0].backgroundColor = .keepinGray1
        imagePlusButton[1].backgroundColor = .keepinGray1
        imagePlusButton[2].backgroundColor = .keepinGray1
        
        imagePlusButton[0].tintColor = UIColor.black
        imagePlusButton[1].tintColor = UIColor.black
        imagePlusButton[2].tintColor = .keepinGray3
    }
}

