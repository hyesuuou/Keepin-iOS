//
//  HomeEventTVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/02.
//

import UIKit

class HomeEventTVC: UITableViewCell {

    public static let identifier = "HomeEventTVC"
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    
    @IBOutlet weak var dateSecondLabel: UILabel!
    @IBOutlet weak var contentsSecontLabel: UILabel!
    
    @IBOutlet weak var reminderFirstButton: UIButton!
    @IBOutlet weak var reminderSecondButton: UIButton!
    @IBOutlet weak var reminderNextButton: UIButton!
    
    @IBOutlet weak var separateView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        //setDummy()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setUI(){
        self.backgroundColor = .keepinGray
        titleLabel.font = UIFont.GmarketSansTTF(.medium, size: 16)
        
        dateLabel.textColor = .keepinGray5
        dateLabel.font = UIFont.NotoSans(.regular, size: 12)
        
        dateSecondLabel.textColor = .keepinGray5
        dateSecondLabel.font = UIFont.NotoSans(.regular, size: 12)
        
        separateView.backgroundColor = .keepinGray4
        
        contentsLabel.textColor = .keepinGray5
        contentsLabel.font = UIFont.GmarketSansTTF(.medium, size: 14)
        contentsSecontLabel.textColor = .keepinGray5
        contentsSecontLabel.font = UIFont.GmarketSansTTF(.medium, size: 14)
        
    }
    
    func setData(date: String, contents: String, important: Bool, secondDate: String, secondContents: String, secondImportant: Bool){
        dateLabel.text = date
        contentsLabel.text = contents
        if important  == false {
            reminderFirstButton.setImage(UIImage(named: "listReminderHome"), for: .normal)
        }
        else {
            reminderFirstButton.setImage(UIImage(named: "listReminderHomeImp"), for: .normal)
        }
        
        dateSecondLabel.text = secondDate
        contentsSecontLabel.text = secondContents
        if secondImportant == true {
            
        }
        else {
            
        }
    
    }
    
    
   
}
