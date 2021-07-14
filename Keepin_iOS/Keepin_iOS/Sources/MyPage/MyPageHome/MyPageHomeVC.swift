//
//  MyPageHomeVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/09.
//

import UIKit

class MyPageHomeVC: UIViewController {
    
    @IBOutlet weak var myPageHomeCV: UICollectionView!
    
    let stickyIndexPath = IndexPath(row: 1, section: 0)
    var countList : Int = 0
    var member : String = ""
    var count1 : Int = 0
    var count2 : Int = 0
    var count3 : Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerXib()
        
        setFlowLayout()
        MyPageHomeDataManager().getNumberKeepin(self)
        MyPageHomeDataManager().getNumberFriend(self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(toPush(_:)), name: NSNotification.Name(rawValue: "push"), object: nil)
    }

    @objc func toPush(_ notification: NSNotification){
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(MyPageDetailVC(), animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    
    
    func registerXib(){
        
        let homeTopNib = UINib(nibName: MyPageHomeTopCVC.identifier, bundle: nil)
        myPageHomeCV.register(homeTopNib, forCellWithReuseIdentifier:MyPageHomeTopCVC.identifier )
        
        let homeHeaderNib = UINib(nibName: MyPageHomeHeaderCVC.identifier, bundle: nil)
        myPageHomeCV.register(homeHeaderNib, forCellWithReuseIdentifier: MyPageHomeHeaderCVC.identifier)
        
        let homeFriendNib = UINib(nibName: MyPageHomeFriendCVC.identifier, bundle: nil)
        myPageHomeCV.register(homeFriendNib, forCellWithReuseIdentifier:MyPageHomeFriendCVC.identifier)
    }
    
    func setFlowLayout(){
        let columnLayout = CustomCollectionViewFlowLayout(stickyIndexPath: stickyIndexPath)
        self.myPageHomeCV.collectionViewLayout = columnLayout
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
            cell.name = member
            
            cell.nameLabel.text = "\(cell.name) 님"
            cell.nameLabel.font = UIFont.GmarketSansTTF(.medium, size: 20)
            cell.nameLabel.textColor = UIColor.keepinBlack
            
            let attributedStr = NSMutableAttributedString(string: cell.nameLabel.text!)
            attributedStr.addAttribute(.foregroundColor, value: UIColor.keepinGreen, range:(cell.nameLabel.text! as NSString).range(of: "\(cell.name)"))
            cell.nameLabel.attributedText = attributedStr
            
            cell.c1 = count1
            cell.num1.text = "\(count1)개"
            cell.num1.font = UIFont.NotoSans(.bold, size: 15)
            cell.num1.textColor = UIColor.keepinGreen
            
            cell.c2 = count2
            cell.num2.text = "\(count2)개"
            cell.num2.font = UIFont.NotoSans(.bold, size: 15)
            cell.num2.textColor = UIColor.keepinGreen
            
            count3 = cell.c3
            cell.num3.text = "\(count3)개"
            cell.num3.font = UIFont.NotoSans(.bold, size: 15)
            cell.num3.textColor = UIColor.keepinGreen
            
            return cell
        
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageHomeHeaderCVC.identifier, for: indexPath)as? MyPageHomeHeaderCVC else {return UICollectionViewCell()}
            
            cell.plusButton.addTarget(self, action: #selector(toPlus), for: UIControl.Event.touchUpInside)
            
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageHomeFriendCVC.identifier, for: indexPath)as? MyPageHomeFriendCVC else {return UICollectionViewCell()}
            //countList = cell.
            //cell.friendName = self.friendServerData?.friends[indexPath.row]
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    @objc func toSetting(){
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(MyPageProfileVC(), animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    
    @objc func toPlus(){
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(KeepinPlusFriendVC(), animated: true)
        self.hidesBottomBarWhenPushed = false
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
            let cellHeight = width * (77/375)
            return CGSize(width: width, height: cellHeight)
        case 2:
            let width = UIScreen.main.bounds.width
            //let cellHeight = width * (385/375)
//            let cellHeight : Int =  64 * MyPageHomeFriendCVC.friendName.count
            
            let height = 64 * MyPageHomeFriendCVC.friendName.count
            //return CGSize(width: width, height: height)
            return CGSize(width: 375, height: height + 100)
            
        
        default:
            let width = UIScreen.main.bounds.width
            let cellHeight = width * (600/375)
            return CGSize(width: width, height: cellHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


extension MyPageHomeVC{
    func didSuccessGetUser(message: String){
        print("서버통신 성공!")
        myPageHomeCV.delegate = self
        myPageHomeCV.dataSource = self
        myPageHomeCV.reloadData()
    }
    
    func didSuccessGetFriend(friendList: [Friend]){
        print("친구 모아보기 서버 통신 성공!!")
        
        for i in friendList{
            MyPageHomeFriendCVC.friendName.append(i.name)
        }
        print("1")
        
        myPageHomeCV.delegate = self
        myPageHomeCV.dataSource = self
        myPageHomeCV.reloadData()
    }
    
    func failedToRequest(message: String){
        print(message)
    }
}
