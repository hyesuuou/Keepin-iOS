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
    
    static let identifier : String = "MyPageHomeFriendCVC"
    
    let friendName = ["삼준","실버","씨워터","삼준","실버","씨워터","삼준","실버","씨워터","삼준","실버","씨워터","삼준","실버","씨워터","삼준","실버","씨워터"]

    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainView2.backgroundColor = .keepinGray
        myPageHomeCV.delegate = self
        myPageHomeCV.dataSource = self
        myPageHomeCV.backgroundColor = .keepinGray
        
        registerXib()
        
    }
    
    func registerXib(){
        let friendListNib = UINib(nibName: FriendListCVC.identifier, bundle: nil)
        myPageHomeCV.register(friendListNib, forCellWithReuseIdentifier: FriendListCVC.identifier)
    }
}

extension MyPageHomeFriendCVC : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension MyPageHomeFriendCVC : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendListCVC.identifier, for: indexPath)as? FriendListCVC else {return UICollectionViewCell()}
        
        cell.friendName?.font = UIFont.GmarketSansTTF(.medium, size: 16)
        cell.layer.cornerRadius = 12
        cell.backgroundColor = .white
        cell.friendName.text = friendName[indexPath.row]
        
        return cell
    }
    
}

extension MyPageHomeFriendCVC : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let width = 343
        let cellHeight = 64
    
        return CGSize(width: width, height: cellHeight)
    
    }
}
