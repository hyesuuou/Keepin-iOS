//
//  MyPageDetailVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class MyPageDetailVC: UIViewController ,UITextViewDelegate{
    
    @IBOutlet weak var myPageDetailCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()

        self.navigationController?.isNavigationBarHidden = true
        myPageDetailCV.delegate = self
        myPageDetailCV.dataSource = self
        dismissKeyboardWhenTappedAround()
    }
    
    
    func registerXib(){
        let topNib = UINib(nibName: MyPageDetailTopCVC.identifier, bundle: nil)
        myPageDetailCV.register(topNib, forCellWithReuseIdentifier: MyPageDetailTopCVC.identifier)
        
        let detailNib = UINib(nibName:MyPageDetailMemoCVC.identifier , bundle: nil)
        myPageDetailCV.register(detailNib, forCellWithReuseIdentifier: MyPageDetailMemoCVC.identifier)
        
        let presentNib = UINib(nibName:MyPageDetailPresentCVC.identifier , bundle: nil)
        myPageDetailCV.register(presentNib, forCellWithReuseIdentifier:MyPageDetailPresentCVC.identifier )
    }
    
    
    @IBAction func toBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func toMore(_ sender: Any) {
        let actionDelete = UIAlertAction(title: "친구 삭제", style: .default)
        
        let actionEdit = UIAlertAction(title: "이름 수정", style: .default){
            (_) in self.navigationController?.pushViewController(MyPageFriendFixVC(), animated: true)
        }
        let actionCancel = UIAlertAction(title: "취소", style: .cancel)
        
        self.presentAlert(
            preferredStyle: .actionSheet, with: actionDelete,actionEdit,actionCancel)
        
    }

}

extension MyPageDetailVC: UICollectionViewDelegate{
    
}

extension MyPageDetailVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row{
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageDetailTopCVC.identifier, for: indexPath)as? MyPageDetailTopCVC else{
                return UICollectionViewCell()
            }
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageDetailPresentCVC.identifier, for: indexPath)as? MyPageDetailPresentCVC else{
                return UICollectionViewCell()
            }
            return cell
            
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageDetailMemoCVC.identifier, for: indexPath)as? MyPageDetailMemoCVC else{
                return UICollectionViewCell()
            }
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}

extension MyPageDetailVC: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.row {
        case 0:
            let width = UIScreen.main.bounds.width
            
            let cellHeight = width * (204/375)
            return CGSize(width: width, height: cellHeight)
        case 1:
            let width = UIScreen.main.bounds.width
            let cellHeight = width * (200/375)
            
            return CGSize(width: width, height: cellHeight)
        case 2:
            let width = UIScreen.main.bounds.width
            let cellHeight = width * (650/375 )
            
            return CGSize(width: width, height: cellHeight)
        
        default:
            let width = UIScreen.main.bounds.width
            let cellHeight = width * (600/375 )
            
            return CGSize(width: width, height: cellHeight)
        }
    }
}
