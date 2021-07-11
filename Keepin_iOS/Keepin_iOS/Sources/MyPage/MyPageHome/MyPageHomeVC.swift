//
//  MyPageHomeVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/09.
//

import UIKit

class MyPageHomeVC: UIViewController {
    
    @IBOutlet weak var myPageHomeCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPageHomeCV.delegate = self
        myPageHomeCV.dataSource = self
        
        registerXib()
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    
    func registerXib(){
        
        let homeTopNib = UINib(nibName: MyPageHomeTopCVC.identifier, bundle: nil)
        myPageHomeCV.register(homeTopNib, forCellWithReuseIdentifier:MyPageHomeTopCVC.identifier )
        
        let homeHeaderNib = UINib(nibName: MyPageHomeHeaderCVC.identifier, bundle: nil)
        myPageHomeCV.register(homeHeaderNib, forCellWithReuseIdentifier: MyPageHomeHeaderCVC.identifier)
        
        let homeFriendNib = UINib(nibName: MyPageHomeFriendCVC.identifier, bundle: nil)
        myPageHomeCV.register(homeFriendNib, forCellWithReuseIdentifier:MyPageHomeFriendCVC.identifier)
    }
    @objc func toProfile(){
        self.navigationController?.pushViewController(MyPageDetailVC(), animated: true)
    }
}


extension MyPageHomeVC : UICollectionViewDelegate{
    

    
}


extension MyPageHomeVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageHomeTopCVC.identifier, for: indexPath)as? MyPageHomeTopCVC else {return UICollectionViewCell()}
            
            cell.settingButton.addTarget(self, action: #selector(toSetting), for: UIControl.Event.touchUpInside)
            
            return cell
        
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageHomeHeaderCVC.identifier, for: indexPath)as? MyPageHomeHeaderCVC else {return UICollectionViewCell()}
            
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageHomeFriendCVC.identifier, for: indexPath)as? MyPageHomeFriendCVC else {return UICollectionViewCell()}
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    @objc func toSetting(){
        self.navigationController?.pushViewController(MyPageProfileVC(), animated: true)
    }
}

extension MyPageHomeVC : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        
        case 0:
            let width = UIScreen.main.bounds.width
            
            let cellHeight = width * (175/375)
            
            return CGSize(width: width, height: cellHeight)
            
        case 1:
            let width = UIScreen.main.bounds.width
            
            let cellHeight = width * (70/375)
            
            return CGSize(width: width, height: cellHeight)
        case 2:
            let width = UIScreen.main.bounds.width
            
            let cellHeight = width * (385/375)
            
            return CGSize(width: width, height: cellHeight)
        
        default:
            let width = UIScreen.main.bounds.width
            
            let cellHeight = width * (600/375)
            
            return CGSize(width: width, height: cellHeight)
        }
    }
}
