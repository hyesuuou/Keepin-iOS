//
//  MyPageTVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/03.
//

import UIKit

class MyPageTVC: UITableViewCell {
    
    static let identifier : String = "MyPageTVC"

    @IBOutlet weak var friendName: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    
        layer.cornerRadius = 12
        layer.masksToBounds = false
    
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "MyPageTVC", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(title: String){
        friendName.text = title
    }
    
   
    override open var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 12
            frame.origin.x += 16
            frame.size.height -= 12
            frame.size.width -= 2 * 16
            super.frame = frame
        }
    }
    
//    override func layoutSubviews() {
//          super.layoutSubviews()
//          //set the values for top,left,bottom,right margins
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 10, right: 16))
//    }
    
    
 
}
