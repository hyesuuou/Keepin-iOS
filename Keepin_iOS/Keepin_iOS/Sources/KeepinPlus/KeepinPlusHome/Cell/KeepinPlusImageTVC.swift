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
    
    @IBOutlet weak var imageContainerConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(){
        imageContainerView[0].isHidden = true
        imageContainerView[1].isHidden = true
        imageContainerView[2].isHidden = true
        setButtonUI()
    }
    
    func setImage(image: UIImage, tag: Int){
        imageContainerView[tag].isHidden = false
        realImageView[tag].image = image
    }
    
    func setButtonUI(){
        imageContainerConstraint.constant = UIScreen.main.bounds.width * (102/375)
        
        imagePlusButton[0].backgroundColor = .keepinGray1
        imagePlusButton[1].backgroundColor = .keepinGray1
        imagePlusButton[2].backgroundColor = .keepinGray1
        
        imagePlusButton[0].tintColor = UIColor.black
        imagePlusButton[1].tintColor = UIColor.black
        imagePlusButton[2].tintColor = .keepinGray3
    }
}

