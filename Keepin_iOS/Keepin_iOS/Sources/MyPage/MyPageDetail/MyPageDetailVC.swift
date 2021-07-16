//
//  MyPageDetailVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class MyPageDetailVC: UIViewController ,UITextViewDelegate{
    
    @IBOutlet weak var myPageDetailCV: UICollectionView!
    
    var friendIdx : String = ""
    var friendName : String = ""
    var allNum : Int = 0
    var giveNum : Int = 0
    var gotNum : Int = 0
    var memoInfo : String = ""
    
    var serverData : PresentDataClass?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()

        self.navigationController?.isNavigationBarHidden = true
        dismissKeyboardWhenTappedAround()
        
        
        MyPageDetailDataManager().getFriendInfo(friendIdx, viewController: self)
        MyPagePresentMoaDataManager().gotPresent(friendIdx, viewController: self)
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
            
            cell.detail1 = allNum
            cell.detail2 = giveNum
            cell.detail3 = gotNum
            cell.userName = friendName
            
            cell.userLabel.text = "\(friendName)님과 \n주고받은 선물"
            cell.number1.text = "\(allNum)개"
            cell.number2.text = "\(giveNum)개"
            cell.number3.text = "\(gotNum)개"
            
            cell.userLabel.font = UIFont.GmarketSansTTF(.medium, size: 20)
            
        
            let attributedStr = NSMutableAttributedString(string: cell.userLabel.text!)
            attributedStr.addAttribute(.foregroundColor, value: UIColor.keepinGreen, range: (cell.userLabel.text! as NSString).range(of: "\(friendName)"))
            cell.userLabel.attributedText = attributedStr
            
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageDetailPresentCVC.identifier, for: indexPath)as? MyPageDetailPresentCVC else{
                return UICollectionViewCell()
            }
            
            cell.textView.text = memoInfo
            
            return cell
            
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageDetailMemoCVC.identifier, for: indexPath)as? MyPageDetailMemoCVC else{
                return UICollectionViewCell()
            }
            
            cell.serverDatas = (serverData!.keepins)
            print("asdadfsdsdfs")
            print(serverData?.keepins)
//            let itemNum : Int = (serverData?.keepins.count)!
//
//            for i in 0...itemNum-1 {
//                cell.test.append((serverData?.keepins[i].title)!)
//                cell.testTwo.append((serverData?.keepins[i].date)!)
//
//            }
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
            let width = Int(UIScreen.main.bounds.width)
            let cellHeight = (228 + 24) * 5
            
            return CGSize(width: width, height: cellHeight)
        
        default:
            let width = UIScreen.main.bounds.width
            let cellHeight = width * (600/375 )
            
            return CGSize(width: width, height: cellHeight)
        }
    }
}


extension MyPageDetailVC{
    func didSuccessGetFriendInfo(messsage: String){
        myPageDetailCV.delegate = self
        myPageDetailCV.dataSource = self
        myPageDetailCV.reloadData()
        
        MyPageDetailMemoCVC.friend = friendIdx
        
    }
    func didSuccessGetPresentInfo(message: String){
//        myPageDetailCV.delegate = self
//        myPageDetailCV.dataSource = self
//
//        myPageDetailCV.reloadData()
        print(serverData)
    }
    func failedToRequest(message: String){
        print(message)
    }
}
