//
//  PresentMoaVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit
import Kingfisher

class PresentMoaVC: UIViewController {

    @IBOutlet weak var presentCV: UICollectionView!
    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!
    @IBOutlet weak var presentCVHeight: NSLayoutConstraint!
    @IBOutlet weak var gave: UIButton!
    @IBOutlet weak var got: UIButton!
    @IBOutlet weak var indicatorBar: UIView!
    @IBOutlet weak var indicatorStart: NSLayoutConstraint!
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var newButton: UIButton!
    
    @IBAction func newButtonClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected{
            if gave.isSelected == true{
                PresentMoaHomeDataManager().gave("false", viewController: self)
            }
            else{
                PresentMoaHomeDataManager().got("false", viewController: self)
            }
        }
        else{
            if gave.isSelected == true{
                PresentMoaHomeDataManager().gave("true", viewController: self)
            }
            else{
                PresentMoaHomeDataManager().got("true", viewController: self)
            }
            
        }
        
    }
    
    @IBAction func btnClicked(sender:UIButton){
        if sender == gave
        {
            gave.isSelected = true
            got.isSelected = false
            if newButton.isSelected{
                PresentMoaHomeDataManager().gave("false", viewController: self)
            }
            else{
                PresentMoaHomeDataManager().gave("true", viewController: self)
            }
            
            UIView.animate(withDuration: 0.2){
                self.indicatorStart.constant = self.buttonStack.frame.width - 13.5
            }
        }
        else{
            gave.isSelected = false
            got.isSelected = true
            if newButton.isSelected{
                PresentMoaHomeDataManager().got("false", viewController: self)
            }
            else{
                PresentMoaHomeDataManager().got("true", viewController: self)
            }
       
            UIView.animate(withDuration: 0.1){
                self.indicatorStart.constant = self.buttonStack.frame.width / 2 - 13
            }
        }
    }
    
    var serverData : Keepins?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setUI()
        self.dismissKeyboardWhenTappedAround()
        
        PresentMoaHomeDataManager().got("true", viewController: self)
    }
    
    func setUI(){
        gave.presentButton()
        got.presentButton()
        
        got.isSelected = true
        gave.isSelected = false
    }
    
    @objc func toSearch(){
        let nextVC = SearchVC()
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: nextVC)
        navBarOnModal.modalPresentationStyle = .overFullScreen
        self.present(navBarOnModal, animated: true, completion: nil)
    }
    
    func setNavigationBar(){
        let searchButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        searchButton.setImage(UIImage(named: "icSearch"), for: UIControl.State.normal)
        searchButton.addTarget(self, action: #selector(toSearch), for: UIControl.Event.touchUpInside)
        searchButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        
        let searchbarButton = UIBarButtonItem(customView: searchButton)
        self.navigationItem.rightBarButtonItem = searchbarButton
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }

}
 
extension PresentMoaVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = PresentDetailVC()
        nextVC.keepinIdx = (serverData?.keepins[indexPath.row]?._id)!
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(nextVC, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (serverData?.keepins.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = presentCV.dequeueReusableCell(withReuseIdentifier: "PresentMoaCVC", for: indexPath) as! PresentMoaCVC
        cell.presentImage.setImage(with:(serverData?.keepins[indexPath.row]?.photo)!)
        cell.presentTitle.text = serverData?.keepins[indexPath.row]?.title
        cell.presentDate.text = serverData?.keepins[indexPath.row]?.date
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 10
        let collectionViewSize = collectionView.frame.size.width - padding
                
        return CGSize(width: collectionViewSize/2, height: 228)
    }
    
    
}

extension PresentMoaVC {
    func didSuccessGot(message: String) {
        presentCV.register(PresentMoaCVC.nib(), forCellWithReuseIdentifier: "PresentMoaCVC")
        presentCV.delegate = self
        presentCV.dataSource = self
        
        var frame: CGRect = self.presentCV.frame
        frame.size.height = self.presentCV.contentSize.height
        self.presentCV.frame = frame

        var itemNum : Int = (self.serverData?.keepins.count)!
        //scrollView dynamic Height
        if itemNum%2 == 1{
            itemNum += 1
        }
        presentCVHeight.constant = CGFloat(240 * itemNum / 2)
        contentViewHeight.constant = presentCVHeight.constant + 100
        presentCV.reloadData()
    }
    
    func didSuccessGave(message: String) {
        presentCV.register(PresentMoaCVC.nib(), forCellWithReuseIdentifier: "PresentMoaCVC")
        presentCV.delegate = self
        presentCV.dataSource = self
        
        var frame: CGRect = self.presentCV.frame
        frame.size.height = self.presentCV.contentSize.height
        self.presentCV.frame = frame

        var itemNum : Int = (self.serverData?.keepins.count)!
        if itemNum%2 == 1{
            itemNum += 1
        }
        //scrollView dynamic Height
        presentCVHeight.constant = CGFloat(240 * itemNum / 2)
        contentViewHeight.constant = presentCVHeight.constant + 100
        presentCV.reloadData()
    }
    
    func failedToRequest(message: String) {
        print(message)
    }
}
