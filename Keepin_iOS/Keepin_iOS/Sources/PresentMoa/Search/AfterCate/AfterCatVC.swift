//
//  AfterCatVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/08.
//

import UIKit

class AfterCatVC: UIViewController {

    var category : String = ""
    var itemNum : Int = 10
    
    @IBOutlet weak var categoryCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        
        categoryCV.register(PresentMoaCVC.nib(), forCellWithReuseIdentifier: "PresentMoaCVC")
        categoryCV.delegate = self
        categoryCV.dataSource = self
    }

    func setNavigationBar(){
        let backButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        backButton.setImage(UIImage(named: "icBack"), for: UIControl.State.normal)
        backButton.addTarget(self, action: #selector(toBack), for: UIControl.Event.touchUpInside)
        backButton.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = category
        label.font = UIFont.GmarketSansTTF(.medium, size: 18)
        
        let categoryLabel = UIBarButtonItem.init(customView: label)
        let backbarButton = UIBarButtonItem(customView: backButton)
        
        self.navigationItem.leftBarButtonItems = [backbarButton, categoryLabel]
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc func toBack(){
        self.navigationController?.popViewController(animated: true)
    }
}

extension AfterCatVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(PresentDetailVC(), animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoryCV.dequeueReusableCell(withReuseIdentifier: "PresentMoaCVC", for: indexPath) as! PresentMoaCVC
//        let food = foods[indexPath.row]
//        cell.configure(with: food.imgUrl, title: food.productName, price: food.price)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 10
        let collectionViewSize = collectionView.frame.size.width - padding
                
        return CGSize(width: collectionViewSize/2, height: 228)
    }
    
    
}
