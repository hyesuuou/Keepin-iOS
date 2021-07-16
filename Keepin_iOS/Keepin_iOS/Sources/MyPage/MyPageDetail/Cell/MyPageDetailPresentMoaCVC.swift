//
//  MyPageDetailPresentMoaCVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/06.
//


import UIKit

class MyPageDetailPresentMoaCVC: UICollectionViewCell {
    
    static let identifier = "MyPageDetailPresentMoaCVC"

    @IBOutlet weak var presentImage: UIImageView!
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var presentDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setStyle()
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "MyPageDetailPresentMoaCVC", bundle: nil)
    }
    
    func setData(title1: String, title2: String){
        //presentImage
        presentLabel.text = title1
        presentDate.text =  title2
    }
    
    func setStyle(){
        presentLabel.textColor = .keepinGray5
        presentDate.textColor = .keepinGray4
    }
    
   
}
