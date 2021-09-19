//
//  PresentDetailVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import Kingfisher
import UIKit

class PresentDetailVC: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var presentDetailCV: UICollectionView!
    @IBOutlet weak var presentDetailCVHeight: NSLayoutConstraint!
    @IBOutlet weak var indicatorBackground: UIImageView!
    @IBOutlet weak var indicator: UIView!
    @IBOutlet weak var indicatorBarWidth: NSLayoutConstraint!
    @IBOutlet weak var indicatorStart: NSLayoutConstraint!
    @IBOutlet weak var presentTitle: UILabel!
    
    @IBOutlet weak var divider: UIView!
    @IBOutlet weak var memoView: UIView!
    @IBOutlet weak var presentFrom: UILabel!
    
    @IBOutlet weak var thoughts: UITextView!
    
    @IBOutlet var cateButtons: [UIButton]!
    
    @IBOutlet weak var date: UILabel!
    
    //MARK: - Custom Variables
    var fromWho : String = ""
    var friendCount : Int = 0
    let viewSizeWidth : CGFloat = UIScreen.main.bounds.width
    var nowPage : Int = 0
    var keepinIdx : String = ""
    var serverData : Details?
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() { 
        super.viewDidLoad()
        
        setUI()
        setNavigationBar()
        
       PresentDetailDataManager().details(keepinIdx, viewController: self)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: viewSizeWidth, height: viewSizeWidth)
        layout.scrollDirection = .horizontal
        presentDetailCV.collectionViewLayout = layout
        presentDetailCV.isPagingEnabled = true
    }

    //MARK: - Custom Methods
    func setUI(){
        presentDetailCVHeight.constant = viewSizeWidth
        divider.backgroundColor = .keepinGray2
        memoView.backgroundColor = .keepinGray1
        presentFrom.textColor = .keepinGray4
        date.textColor = .keepinGray4
        
        thoughts.backgroundColor = .clear
        
        indicator.isHidden = true
        indicatorBackground.isHidden = true
    }

    func setNavigationBar(){
        let searchButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        searchButton.setImage(UIImage(named: "icMore"), for: UIControl.State.normal)
        searchButton.addTarget(self, action: #selector(toDetail), for: UIControl.Event.touchUpInside)
        searchButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        let backButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        backButton.setImage(UIImage(named: "icBack"), for: UIControl.State.normal)
        backButton.addTarget(self, action: #selector(toBack), for: UIControl.Event.touchUpInside)
        backButton.frame = CGRect(x: 0, y: 50, width: 32, height: 32)
        
        
        let backbarButton = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backbarButton
        
        let searchbarButton = UIBarButtonItem(customView: searchButton)
        self.navigationItem.rightBarButtonItem = searchbarButton
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    //MARK: - @objc Methods
    @objc func toBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func toDetail(){
        let actionDelete = UIAlertAction(title: "삭제하기", style: .default) { action in
            self.presentAlert(title: "", message: "삭제하시겠습니까?", isCancelActionIncluded: true) { action in
                //삭제되야함
                var keepinToErase : [String] = []
                keepinToErase.append((self.serverData?._id)!)
                let request = DetailEraseRequest(keepinArray: keepinToErase)
                PresentDetailDataManager().detailDelete(request, viewController: self)
//                PresentMoaHomeDataManager().got("true", viewController: self)
//                self.navigationController?.popViewController(animated: true)
            }
        }
        let actionEdit = UIAlertAction(title: "수정하기", style: .default) { action in
            //수정하기로 가야됨
        }
        let actionCancel = UIAlertAction(title: "취소", style: .cancel) { action in
            //다이얼로그 내리기
        }
        self.presentAlert(
            preferredStyle: .actionSheet,
            with: actionDelete, actionEdit, actionCancel
        )
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension PresentDetailVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        for i in 0...(serverData?.photo.count)! - 1{
            if scrollView.contentOffset == CGPoint(x: viewSizeWidth*CGFloat(i), y: 0.0) {
                nowPage = i
                let plus = self.viewSizeWidth / CGFloat((serverData?.photo.count)!)
                if(nowPage == 0){
                    self.indicatorStart.constant = 0
                }
                else{
                    UIView.animate(withDuration: 0.1){
                        self.indicatorStart.constant = plus*CGFloat(i)
                    }
                }
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (serverData?.photo.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = presentDetailCV.dequeueReusableCell(withReuseIdentifier: "PresentDetailCVC", for: indexPath) as! PresentDetailCVC
        
        cell.presentImage.setImage(with: (serverData?.photo[indexPath.row])!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

//MARK: - Server Functions
extension PresentDetailVC {
    func didSuccessDetail(message: String) {
        presentDetailCV.register(PresentDetailCVC.nib(), forCellWithReuseIdentifier: "PresentDetailCVC")
        presentDetailCV.delegate = self
        presentDetailCV.dataSource = self
        
        var frame: CGRect = self.presentDetailCV.frame
        frame.size.height = self.presentDetailCV.contentSize.height
        self.presentDetailCV.frame = frame
        
        presentDetailCV.reloadData()
        
        friendCount = (serverData?.friends.count)!
        if friendCount == 1{
            fromWho = (serverData?.friends[0]?.name)! + "님"
        }
        else{
            fromWho = (serverData?.friends[0]?.name)! + "님 외 " + String(friendCount-1) + "명"
        }
        
        if ((serverData?.taken) == true){
            presentFrom.text = "\(fromWho)에게 받은 선물"
            let attributedString = NSMutableAttributedString(string: presentFrom.text!)
            attributedString.addAttribute(.foregroundColor, value: UIColor.keepinGreen, range: (presentFrom.text! as NSString).range(of:"받은 선물"))
            presentFrom.attributedText = attributedString
        }
        else{
            presentFrom.text = "\(fromWho)에게 준 선물"
            let attributedString = NSMutableAttributedString(string: presentFrom.text!)
            attributedString.addAttribute(.foregroundColor, value: UIColor.keepinGreen, range: (presentFrom.text! as NSString).range(of:"준 선물"))
            presentFrom.attributedText = attributedString
        }
        
        presentTitle.text = serverData?.title
        thoughts.text = serverData?.record
        date.text = serverData?.date
        
        indicatorBarWidth.constant = viewSizeWidth / CGFloat((serverData?.photo.count)!)
        
        if (serverData?.photo.count)! != 1{
            indicator.isHidden = false
            indicatorBackground.isHidden = false
        }
        
        if (serverData?.category.count)! > 0{
            for i in 0...(serverData?.category.count)!-1{
                cateButtons[i].cateImage(category: (serverData?.category[i])!)
            }
        }
        

    }
    
    func didSuccessDelete(message: String) {
        print(message)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func failedToRequest(message: String) { 
        print(message)
    }
}

