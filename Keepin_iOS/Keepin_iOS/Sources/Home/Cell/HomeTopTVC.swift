//
//  HomeTopTVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/02.
//

import UIKit

class HomeTopTVC: UITableViewCell {
    
    public static let identifier = "HomeTopTVC"
    
    let username: String = "\(UserDefaults.standard.value(forKey: "name") as! String)"
    let welcomeMessage: [String] = ["직접 준 선물도 키핀해 보세요.",
                                    "화면을 아래로 당겨볼까요?",
                                    "감동받은 메시지도 키핀하세요.",
                                    "오늘도 선물 같은 하루!",
                                    "감사한 순간을 공유해 주세요!",
                                    "선물은 미리미리 골라야죠!",
                                    "지금 키핀하러 가볼까요?",
                                    "예전에 받은 그 선물, 키핀해요!"]
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var randomImageView: UIImageView!
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var emptyBgView: UIView!
    @IBOutlet weak var emptyImageView: UIImageView!
    
    @IBOutlet weak var randomImageHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUI(){
        // 랜덤이미지, 랜덤타이틀 UI
        //randomImageView.image = UIImage(named: "imgEmptyEyes")
        //messageLabel.text = ""
        messageLabel.font = UIFont.GmarketSansTTF(.medium, size: 14)
        messageLabel.textColor = .keepinGray5
        
        emptyLabel.font = UIFont.GmarketSansTTF(.medium, size: 14)
        emptyLabel.textColor = .keepinGray3
        emptyBgView.backgroundColor = .keepinGray1
    }
    
    // MARK: - Welcome Label 셋팅
    func setData(){
        welcomeLabel.text = "\(username)님\n\(welcomeMessage.randomElement() ?? "")"
        welcomeLabel.font = UIFont.GmarketSansTTF(.medium, size: 22)
        let attributedStr = NSMutableAttributedString(string: welcomeLabel.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        attributedStr.addAttribute(.foregroundColor, value: UIColor.keepinGreen , range: (welcomeLabel.text! as NSString).range(of: "\(username)"))
        attributedStr.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedStr.length))
        welcomeLabel.attributedText = attributedStr
    }

}
