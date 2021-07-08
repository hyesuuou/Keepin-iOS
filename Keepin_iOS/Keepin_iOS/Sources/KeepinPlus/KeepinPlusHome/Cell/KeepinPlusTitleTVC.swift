//
//  KeepinPlusTitleTVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/09.
//

import UIKit

class KeepinPlusTitleTVC: UITableViewCell {
    
    public static let identifier = "KeepinPlusTitleTVC"

    @IBOutlet weak var importantImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(title : String, subtitle: String, image : Bool) {
        
        titleLabel.text = title
        subtitleLabel.text = subtitle
        if image == true {
            importantImageView.isHidden = false
        }
        else {
            importantImageView.isHidden = true
        }
        
    }
    
    func setUI(){
        titleLabel.font = UIFont.GmarketSansTTF(.medium, size: 16)
        subtitleLabel.font = UIFont.GmarketSansTTF(.light, size: 16)
        subtitleLabel.textColor = .keepinGray4
        
    }
    
}
