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
    static var friendId : [String] = []
    var index : Int = 0

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
    
    @objc func notification(){
//    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "push"), object: index)
    }
   
}

extension MyPageHomeFriendCVC : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let friendID = MyPageHomeDataManager.friendList[indexPath.row].id
        let nextVC = MyPageDetailVC()
        nextVC.friendIdx = friendID
        NotificationCenter.default.post(name: NSNotification.Name("push"), object: friendID)
    }
}

extension MyPageHomeFriendCVC : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return friendName.count
        return MyPageHomeFriendCVC.friendName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendListCVC.identifier, for: indexPath)as? FriendListCVC else {return UICollectionViewCell()}
        
        cell.moveButton.addTarget(self, action: #selector(notification), for: .touchUpInside)
        cell.friendName?.font = UIFont.GmarketSansTTF(.medium, size: 16)
        cell.layer.cornerRadius = 12
        cell.setData(title: MyPageHomeDataManager.friendList[indexPath.row].name)
        
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
