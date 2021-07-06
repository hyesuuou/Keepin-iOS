//
//  PresentDetailVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class PresentDetailVC: UIViewController {

    @IBOutlet weak var presentTitle: UILabel!
    
    @IBOutlet weak var divider: UIView!
    @IBOutlet weak var memoView: UIView!
    @IBOutlet weak var presentFrom: UILabel!
    
    @IBOutlet weak var thoughts: UITextView!
    
    let fromWho : String = "박윤정님 외 3명"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        presentFrom.text = "\(fromWho)에게 받은 선물"
        divider.backgroundColor = .keepinGray2
        memoView.backgroundColor = .keepinGray2
        presentFrom.textColor = .keepinGray4
        
        let attributedString = NSMutableAttributedString(string: presentFrom.text!)
        attributedString.addAttribute(.foregroundColor, value: UIColor.keepinGreen, range: (presentFrom.text! as NSString).range(of:"받은 선물"))
        
        presentFrom.attributedText = attributedString
        
        //thoughts.isScrollEnabled = false
    }


    func setNavigationBar(){
        let searchButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        searchButton.setImage(UIImage(named: "icMore"), for: UIControl.State.normal)
        searchButton.addTarget(self, action: #selector(toDetail), for: UIControl.Event.touchUpInside)
        searchButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        let backButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        backButton.setImage(UIImage(named: "icBack"), for: UIControl.State.normal)
        backButton.addTarget(self, action: #selector(toBack), for: UIControl.Event.touchUpInside)
        backButton.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        
        let backbarButton = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backbarButton
        
        let searchbarButton = UIBarButtonItem(customView: searchButton)
        self.navigationItem.rightBarButtonItem = searchbarButton
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc func toBack(){
        self.navigationController?.popViewController(animated: true)
        print("pop")
    }
    
    @objc func toDetail(){
        print("Detail")
        let actionDelete = UIAlertAction(title: "삭제하기", style: .default) { action in
            self.view.backgroundColor = .red
        }
        let actionEdit = UIAlertAction(title: "수정하기", style: .default) { action in
            self.view.backgroundColor = .green
        }
        let actionCancel = UIAlertAction(title: "취소", style: .cancel) { action in
            self.view.backgroundColor = .white
        }
        self.presentAlert(
            preferredStyle: .actionSheet,
            with: actionDelete, actionEdit, actionCancel
        )
    }
}
