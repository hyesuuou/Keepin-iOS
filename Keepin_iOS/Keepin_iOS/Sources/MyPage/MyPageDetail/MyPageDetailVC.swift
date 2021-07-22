//
//  MyPageDetailVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class MyPageDetailVC: UIViewController,UITextViewDelegate{
    
    @IBOutlet weak var myPageCollectionView: UICollectionView!
    
    @IBOutlet weak var mainLabel: UILabel!
    var name : String = ""
    var num1: Int = 0
    var num2: Int = 0
    var num3: Int = 0
    var friendIdx : String = ""
    
    var memoText: String = ""
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var stackView1: UIView!
    @IBOutlet weak var stackView2: UIView!
    
    @IBOutlet weak var allLabel: UILabel!
    @IBOutlet weak var gotLabel: UILabel!
    @IBOutlet weak var giveLabel: UILabel!
    
    @IBOutlet weak var allNum: UILabel!
    @IBOutlet weak var gotNum: UILabel!
    @IBOutlet weak var giveNum: UILabel!
    
    @IBOutlet weak var memoView: UIView!
    @IBOutlet weak var memoLabel: UILabel!
    @IBOutlet weak var memoTextView: UITextView!
    
    @IBOutlet weak var gotButton: UIButton!
    @IBOutlet weak var giveButton: UIButton!
    @IBOutlet weak var BntLineView: UIView!
    @IBOutlet weak var BntLineViewStart: NSLayoutConstraint!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyPageDetailDataManager().getFriendInfo(friendIdx, viewController: self)
        setButtonUI()
        self.navigationController?.isNavigationBarHidden = true
        dismissKeyboardWhenTappedAround()
        
        registerCV()
        registerNib()
        placeholderSetting()
        textViewDidBeginEditing(memoTextView)
        textViewDidEndEditing(memoTextView)
        
    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
        if sender == gotButton
        {
            gotButton.isSelected = true
            giveButton.isSelected = false
        
            UIView.animate(withDuration: 0.2){
                self.BntLineViewStart.constant = self.BntLineView.frame.width/2 + 43
            }
            
        }
        else{
            gotButton.isSelected = false
            giveButton.isSelected = true
            
            UIView.animate(withDuration: 0.2){
                self.BntLineViewStart.constant = self.BntLineView.frame.width - 10
        }
        
        }
    }
        
    func setButtonUI(){
        gotButton.presentButton()
        giveButton.presentButton()
            
        gotButton.isSelected = true
        giveButton.isSelected = false
    }
    
    func registerNib(){
        let presentMoaNib = UINib(nibName:"MyPagePresentMoaCVC", bundle: nil)
        myPageCollectionView.register(presentMoaNib, forCellWithReuseIdentifier: "MyPagePresentMoaCVC")
    }
    
    func registerCV(){
        myPageCollectionView.delegate = self
        myPageCollectionView.dataSource = self
        
    }
    
    func placeholderSetting() {
        memoTextView.delegate = self // textView가 유저가 선언한 outlet
        memoTextView.text = "친구의 취향을 기록해보세요.\n최대 5줄까지 입력 가능합니다."
        memoTextView.textColor = .keepinGray5
    }
    
    // TextView Place Holder
    func textViewDidBeginEditing(_ textView: UITextView) {
        if memoTextView.textColor == .keepinGray5 {
            memoTextView.text = nil
            memoTextView.textColor = UIColor.black
        }
        
    }
    // TextView Place Holder
    func textViewDidEndEditing(_ textView: UITextView) {
        if memoTextView.text.isEmpty {
            memoTextView.text = "친구의 취향을 기록해보세요.\n최대 5줄까지 입력 가능합니다."
            memoTextView.textColor = .keepinGray5
    }
    }
    
    func setStyle(){
        mainLabel.text = "\(name)님과 \n주고받은 선물"
        
        mainLabel.font = UIFont.GmarketSansTTF(.medium, size: 20)
        mainLabel.textColor = .keepinBlack
        
        let attributedStr = NSMutableAttributedString(string: mainLabel.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.keepinGreen, range: (mainLabel.text! as NSString).range(of: "\(name)"))
        mainLabel.attributedText = attributedStr
        
        mainView.layer.cornerRadius = 12
        mainView.backgroundColor = .keepinGray
        
        stackView1.backgroundColor = .keepinGray4
        stackView2.backgroundColor = .keepinGray4
        
        allLabel.text = "총 선물"
        allLabel.textColor = .keepinGray5
        gotLabel.text = "받은 선물"
        gotLabel.textColor = .keepinGray5
        giveLabel.text = "준 선물"
        giveLabel.textColor = .keepinGray5
        
        allLabel.font = UIFont.NotoSans(.regular, size: 14)
        gotLabel.font = UIFont.NotoSans(.regular, size: 14)
        giveLabel.font = UIFont.NotoSans(.regular, size: 14)
        
        allNum.text = "\(num1)개"
        gotNum.text = "\(num2)개"
        giveNum.text = "\(num3)개"
        allNum.textColor = .keepinGreen
        gotNum.textColor = .keepinGreen
        giveNum.textColor = .keepinGreen
        
        allNum.font = UIFont.NotoSans(.bold, size: 16)
        gotNum.font = UIFont.NotoSans(.bold, size: 16)
        giveNum.font = UIFont.NotoSans(.bold, size: 16)
        
        memoView.backgroundColor = .keepinGray
        memoView.layer.cornerRadius = 12
        
        memoLabel.text = "친구 메모"
        memoLabel.textColor = .keepinBlack
        memoLabel.font = UIFont.GmarketSansTTF(.medium, size: 16)
        memoTextView.backgroundColor = .keepinGray
        memoTextView.text = memoText
        
        BntLineView.backgroundColor = .keepinGreen
        
        myPageCollectionView.backgroundColor = .keepinGray
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



extension MyPageDetailVC : UICollectionViewDelegate{
    
}

extension MyPageDetailVC : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (164/375)
        let cellHeight = cellWidth * (228/168)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}

extension MyPageDetailVC : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let presentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPagePresentMoaCVC", for: indexPath) as? MyPagePresentMoaCVC else {return UICollectionViewCell()}
        
        
        presentCell.presentTitle.text = "학교에서 다이어리 받은날"
        presentCell.presentData.text = " 20201.201.12"
        
        if let image = UIImage(named: "image36"){
            presentCell.presentImage.image = image
        }
       
        
        return presentCell
    }
}

extension MyPageDetailVC
{
    func didSuccessGetFriendInfo(message: String){
        print("마이페이지 친구 상세 상단부분 서버통신 성공~!~!")
        setStyle()
    }
    
    func didSuccessGetPresentInfo(message: String){
        
    }
}
