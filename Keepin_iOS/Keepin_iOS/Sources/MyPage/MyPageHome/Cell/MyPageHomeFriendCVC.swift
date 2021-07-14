//
//  MyPageHomeFriendCVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/09.
//

import UIKit

class MyPageHomeFriendCVC: UICollectionViewCell {

    @IBOutlet weak var myPageHomeCV: UICollectionView!
    @IBOutlet weak var mainView2: UIView!
    
    //var friendServerData : FriendDataClass?
    
    static let identifier : String = "MyPageHomeFriendCVC"
    
    static var friendName : [String] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        myPageHomeCV.delegate = self
        myPageHomeCV.dataSource = self
        myPageHomeCV.backgroundColor = .keepinGray
        
        registerXib()
        
    }
    
    func registerXib(){
        let friendListNib = UINib(nibName: FriendListCVC.identifier, bundle: nil)
        myPageHomeCV.register(friendListNib, forCellWithReuseIdentifier: FriendListCVC.identifier)
    }
    /*
    func setData(){
        friendName.append()
    }*/
}

extension MyPageHomeFriendCVC : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension MyPageHomeFriendCVC : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return friendName.count
        return MyPageHomeFriendCVC.friendName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendListCVC.identifier, for: indexPath)as? FriendListCVC else {return UICollectionViewCell()}
        
        cell.friendName?.font = UIFont.GmarketSansTTF(.medium, size: 16)
        cell.layer.cornerRadius = 12
        //cell.backgroundColor = .white
        cell.setData(title: MyPageHomeFriendCVC.friendName[indexPath.row])
        
        return cell
    }
    
}

extension MyPageHomeFriendCVC : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let width = 343
        let cellHeight = 64
    
        return CGSize(width: width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

}





