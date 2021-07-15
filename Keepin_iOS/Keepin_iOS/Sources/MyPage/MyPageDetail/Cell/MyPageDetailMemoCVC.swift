//
//  MyPageDetailMemoCVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/05.
//

import UIKit

class MyPageDetailMemoCVC: UICollectionViewCell {
    
    @IBOutlet weak var presentMoaCV: UICollectionView!
    
    @IBOutlet weak var stackWidth: NSLayoutConstraint!
    @IBOutlet weak var indicatorStart: NSLayoutConstraint!
    @IBOutlet weak var got: UIButton!
    @IBOutlet weak var gave: UIButton!
    @IBOutlet weak var indicatorBar: UIView!
    @IBOutlet weak var buttonStack: UIStackView!
    
    public static let identifier = "MyPageDetailMemoCVC"
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print(indicatorBar.frame.origin.x)
        indicatorBar.backgroundColor = .keepinGreen
        presentMoaCV.delegate = self
        presentMoaCV.dataSource = self
    
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 165, height: 228)
        presentMoaCV.collectionViewLayout = layout
        
        presentMoaCV.frame.size.height = presentMoaCV.contentSize.height
        print(presentMoaCV.contentSize.height)
        registerXib()
        setUI()
        
        stackWidth.constant = UIScreen.main.bounds.width * (88/375)

        indicatorStart.constant = UIScreen.main.bounds.width * (72.5/375)
    }
    
    @IBAction func newButtonDidTap(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func btnClicked(_ sender: UIButton){
        if sender == gave
        {
            gave.isSelected = true
            got.isSelected = false
            
            UIView.animate(withDuration: 0.2){
                
                self.indicatorBar.frame.origin.x = UIScreen.main.bounds.width * (330/375)
            }
        }else if sender == got{
            got.isSelected = true
            gave.isSelected = false
            UIView.animate(withDuration: 0.2){
                
                self.indicatorBar.frame.origin.x = UIScreen.main.bounds.width * (280/375)
                
            }
        }
    }
    
    func setUI(){
        gave.presentButton()
        got.presentButton()
        
        got.isSelected = true
        gave.isSelected = false

    }
    
    
    func registerXib(){
        let moaNib = UINib(nibName: MyPageDetailPresentMoaCVC.identifier , bundle: nil)
        presentMoaCV.register(moaNib, forCellWithReuseIdentifier: MyPageDetailPresentMoaCVC.identifier)
    }
    
    

}


extension MyPageDetailMemoCVC: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = presentMoaCV.dequeueReusableCell(withReuseIdentifier: MyPageDetailPresentMoaCVC.identifier, for: indexPath) as! MyPageDetailPresentMoaCVC
        
        return cell
    }
    
    

}

extension MyPageDetailPresentCVC:UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 10
        let collectionViewSize = collectionView.frame.size.width - padding

        return CGSize(width: 168, height: 228)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }

    
}

