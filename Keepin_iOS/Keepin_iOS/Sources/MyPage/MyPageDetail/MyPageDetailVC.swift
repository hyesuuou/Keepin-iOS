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
        setNavigationBar()

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
    
    
    func setNavigationBar(){
        let searchButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        searchButton.setImage(UIImage(named: "icMore"), for: UIControl.State.normal)
        /*searchButton.addTarget(self, action: #selector(toSearch), for: UIControl.Event.touchUpInside)*/
        searchButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        
        let backButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        backButton.setImage(UIImage(named: "icBack"), for: UIControl.State.normal)
        backButton.addTarget(self, action: #selector(toBack), for: UIControl.Event.touchUpInside)
        backButton.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        
        let searchbarButton = UIBarButtonItem(customView: searchButton)
        self.navigationItem.rightBarButtonItem = searchbarButton
        
        let backbarButton = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backbarButton
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc func toBack(){
        self.navigationController?.popViewController(animated: true)
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
        //let width = UIScreen.main.bounds.width
        
        
    }

}
