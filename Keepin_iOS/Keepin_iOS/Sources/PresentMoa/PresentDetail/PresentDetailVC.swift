//
//  PresentDetailVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class PresentDetailVC: UIViewController {

    @IBOutlet weak var presentDetailCV: UICollectionView!
    @IBOutlet weak var indicatorBackground: UIImageView!
    @IBOutlet weak var indicator: UIView!
    @IBOutlet weak var indicatorBarWidth: NSLayoutConstraint!
    @IBOutlet weak var indicatorStart: NSLayoutConstraint!
    @IBOutlet weak var presentTitle: UILabel!
    
    @IBOutlet weak var divider: UIView!
    @IBOutlet weak var memoView: UIView!
    @IBOutlet weak var presentFrom: UILabel!
    
    @IBOutlet weak var thoughts: UITextView!
    
    @IBOutlet weak var cateButton1: UIButton!
    @IBOutlet weak var cateButton2: UIButton!
    
    @IBOutlet weak var date: UILabel!
    
    let fromWho : String = "박윤정님 외 3명"
    let viewSizeWidth : CGFloat = UIScreen.main.bounds.width
    var nowPage : Int = 0
    var itemNum : Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setUI()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 375, height: 375)
        layout.scrollDirection = .horizontal
        presentDetailCV.collectionViewLayout = layout
        presentDetailCV.isPagingEnabled = true
        presentDetailCV.register(PresentDetailCVC.nib(), forCellWithReuseIdentifier: "PresentDetailCVC")
        presentDetailCV.delegate = self
        presentDetailCV.dataSource = self
    }

    func setUI(){
        presentFrom.text = "\(fromWho)에게 받은 선물"
        divider.backgroundColor = .keepinGray2
        memoView.backgroundColor = .keepinGray1
        presentFrom.textColor = .keepinGray4
        
        let attributedString = NSMutableAttributedString(string: presentFrom.text!)
        attributedString.addAttribute(.foregroundColor, value: UIColor.keepinGreen, range: (presentFrom.text! as NSString).range(of:"받은 선물"))
        
        presentFrom.attributedText = attributedString
        thoughts.backgroundColor = .clear
        
        indicatorBarWidth.constant = viewSizeWidth / CGFloat(itemNum)

        if itemNum == 1{
            indicator.isHidden = true
            indicatorBackground.isHidden = true
        }
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
    
    @objc func toBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func toDetail(){
        let actionDelete = UIAlertAction(title: "삭제하기", style: .default) { action in
            self.view.backgroundColor = .red
        }
        let actionEdit = UIAlertAction(title: "수정하기", style: .default) { action in
            self.view.backgroundColor = .green
        }
        let actionCancel = UIAlertAction(title: "취소", style: .cancel) { action in
            self.view.backgroundColor = .white
        }
        self.presentAlert(
            preferredStyle: .actionSheet,
            with: actionDelete, actionEdit, actionCancel
        )
    }
}

extension PresentDetailVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        for i in 0...itemNum{
            if scrollView.contentOffset == CGPoint(x: viewSizeWidth*CGFloat(i), y: 0.0) {
                nowPage = i
                let plus = self.viewSizeWidth / CGFloat(itemNum)
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
        return itemNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = presentDetailCV.dequeueReusableCell(withReuseIdentifier: "PresentDetailCVC", for: indexPath) as! PresentDetailCVC
//        let food = foods[indexPath.row]
//        cell.configure(with: food.imgUrl, title: food.productName, price: food.price)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 375, height: 375)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
