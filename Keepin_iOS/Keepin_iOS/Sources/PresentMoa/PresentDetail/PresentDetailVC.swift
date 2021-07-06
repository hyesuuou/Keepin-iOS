//
//  PresentDetailVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class PresentDetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        setNavigationBar()
        
        
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
