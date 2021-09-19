//
//  PresentMoaVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import Kingfisher
import UIKit

class PresentMoaVC: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var presentCV: UICollectionView!
    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!
    @IBOutlet weak var presentCVHeight: NSLayoutConstraint!
    @IBOutlet weak var gave: UIButton!
    @IBOutlet weak var got: UIButton!
    @IBOutlet weak var indicatorBar: UIView!
    @IBOutlet weak var indicatorStart: NSLayoutConstraint!
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var noPresent: UILabel!
    
    //MARK: - IBActions
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
    
    //MARK: - Custom Variables
    var serverData : Keepins?
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setUI()
        self.dismissKeyboardWhenTappedAround()
        
        let layout = UICollectionViewFlowLayout()
        let deviceWidth = (UIScreen.main.bounds.width - 40)-2
        layout.itemSize = CGSize(width: deviceWidth/2, height: 228)
        presentCV.collectionViewLayout = layout
        
        NotificationCenter.default.addObserver(self,
                            selector: #selector(pageReload),
                                        name: Notification.Name("keepinMoaReload"),
                                            object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if newButton.isSelected{
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
    
    //MARK: - Custom Methods
    func setUI(){
        gave.presentButton()
        got.presentButton()
        
        got.isSelected = true
        gave.isSelected = false
        
        noPresent.textColor = .keepinGray3
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
    
    //MARK: - @objc Methods
    @objc func toSearch(){
        let nextVC = SearchVC()
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: nextVC)
        navBarOnModal.modalPresentationStyle = .overFullScreen
        self.present(navBarOnModal, animated: true, completion: nil)
    }
    
    @objc func pageReload(notification: NSNotification){
        print("pageReload")
        self.presentCV.reloadData()
    }
    

}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
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
}

//MARK: - Server Functions
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
        print(itemNum)
        if itemNum == 0{
            emptyView.isHidden = false
            presentCV.isHidden = true
            contentViewHeight.constant = UIScreen.main.bounds.height - 200
        }
        else if itemNum%2 == 1{
            itemNum += 1
            presentCV.isHidden = false
            emptyView.isHidden = true
            presentCVHeight.constant = CGFloat(240 * itemNum / 2)
            contentViewHeight.constant = presentCVHeight.constant + 100
        }
        else{
            presentCV.isHidden = false
            emptyView.isHidden = true
            presentCVHeight.constant = CGFloat(240 * itemNum / 2)
            contentViewHeight.constant = presentCVHeight.constant + 100
        }
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
        print(itemNum)
        if itemNum == 0{
            emptyView.isHidden = false
            presentCV.isHidden = true
            contentViewHeight.constant = UIScreen.main.bounds.height - 200
        }
        else if itemNum%2 == 1{
            itemNum += 1
            presentCV.isHidden = false
            emptyView.isHidden = true
            presentCVHeight.constant = CGFloat(240 * itemNum / 2)
            contentViewHeight.constant = presentCVHeight.constant + 100
        }
        else{
            presentCV.isHidden = false
            emptyView.isHidden = true
            presentCVHeight.constant = CGFloat(240 * itemNum / 2)
            contentViewHeight.constant = presentCVHeight.constant + 100
        }
        presentCV.reloadData()
    }
    
    func failedToRequest(message: String) {
        print(message)
    }
}
