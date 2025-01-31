//
//  UIButton.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import Foundation
import UIKit

// MARK: UIButton 내에 Indicator 표시
extension UIButton {
    func showIndicator() {
        let indicator = UIActivityIndicatorView()
        let buttonHeight = self.bounds.size.height
        let buttonWidth = self.bounds.size.width
        indicator.center = CGPoint(x: buttonWidth / 2, y: buttonHeight / 2)
        self.addSubview(indicator)
        indicator.startAnimating()
    }
    
    func dismissIndicator() {
        for view in self.subviews {
            if let indicator = view as? UIActivityIndicatorView {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
            }
        }
    }
    
    func presentButton() {
        self.tintColor = .clear
        self.setTitleColor(.keepinGray4, for: .normal)
        self.setTitleColor(.keepinGreen, for: .selected)
    }
    
    func cateImage(category : String){
        if category == "생일"{
            self.setImage(UIImage(named: "icCateBirthday"), for: .normal)
        }
        else if category == "기념일"{
            self.setImage(UIImage(named: "icCateAnniversary"), for: .normal)
        }
        else if category == "축하"{
            self.setImage(UIImage(named: "icCateCelebrate"), for: .normal)
        }
        else if category == "칭찬"{
            self.setImage(UIImage(named: "icCateCompliment"), for: .normal)
        }
        else if category == "응원"{
            self.setImage(UIImage(named: "icCateCheer"), for: .normal)
        }
        else if category == "감사"{
            self.setImage(UIImage(named: "icCateThanks"), for: .normal)
        }
        else if category == "깜짝"{
            self.setImage(UIImage(named: "icCateSurprise"), for: .normal)
        }
        else{
            self.setImage(UIImage(named: "icCateEtc"), for: .normal)
        }
    }
    
}
