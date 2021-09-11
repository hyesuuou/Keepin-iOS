//
//  HomeTopTVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/02.
//

import UIKit

class HomeTopTVC: UITableViewCell {
    
    public static let identifier = "HomeTopTVC"
    
    let username : String = "\(Token.name)"
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var randomImageView: UIImageView!
    
    @IBOutlet weak var randomImageHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUI(){
        
        // welcomeLabel UI
        welcomeLabel.text = "\(username)님\n키핀은 아름다워요"
        welcomeLabel.font = UIFont.GmarketSansTTF(.medium, size: 22)
        let attributedStr = NSMutableAttributedString(string: welcomeLabel.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        attributedStr.addAttribute(.foregroundColor, value: UIColor.keepinGreen , range: (welcomeLabel.text! as NSString).range(of: "\(username)"))
        attributedStr.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedStr.length))
        welcomeLabel.attributedText = attributedStr
    
        // 랜덤이미지, 랜덤타이틀 UI
        randomImageView.image = UIImage(named: "imgEmptyEyes")
        messageLabel.text = ""
        messageLabel.font = UIFont.GmarketSansTTF(.medium, size: 14)
        messageLabel.textColor = .keepinGray5
    }
}
