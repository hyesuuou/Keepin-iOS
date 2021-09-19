//
//  SearchVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/02.
//

import UIKit

class SearchVC: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchBarDivider: UIImageView!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet var categoryButton: [UIButton]!
    @IBOutlet weak var searchResultCV: UICollectionView!
    @IBOutlet weak var noSearchView: UIView!
    @IBOutlet weak var noSearch: UILabel!
    @IBOutlet weak var stackview: UIStackView!
    
    //MARK: - IBActions
    @IBAction func categoryButtonClicked(_ sender: UIButton) {
        let index = categoryButton.firstIndex(of: sender)!
        let nextVC = AfterCatVC()
        switch index {
        case 0:
            nextVC.category = "생일"
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 1:
            nextVC.category = "기념일"
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 2:
            nextVC.category = "축하"
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 3:
            nextVC.category = "칭찬"
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 4:
            nextVC.category = "응원"
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 5:
            nextVC.category = "감사"
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 6:
            nextVC.category = "깜짝"
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 7:
            nextVC.category = "기타"
            self.navigationController?.pushViewController(nextVC, animated: true)
        default:
           break
        }
    }
    
    //MARK: - Custom Variables
    var itemNum : Int = 0
    var presentList : [Keepin?] = []
    var filteredData: [Keepin?] = []
    var serverData : Keepins?
    var load : Bool = true
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        setNavigationBar()
        setSearchBar()
        self.dismissKeyboardWhenTappedAround()
        SearchDataManager().getPresents(self)  
        
        searchResultCV.register(PresentMoaCVC.nib(), forCellWithReuseIdentifier: "PresentMoaCVC")
        searchResultCV.delegate = self
        searchResultCV.dataSource = self
        
        stackview.isHidden = false
        noSearch.textColor = .keepinGray3
        load = false
    }

    //MARK: - Custom Methods
    func setNavigationBar(){
        let exitButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        exitButton.setImage(UIImage(named: "icX"), for: UIControl.State.normal)
        exitButton.addTarget(self, action: #selector(dismissScreen), for: UIControl.Event.touchUpInside)
        exitButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)

        let exitbarButton = UIBarButtonItem(customView: exitButton)
        self.navigationItem.leftBarButtonItem = exitbarButton
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    
    func setSearchBar(){
        searchBar.barTintColor = .white
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            //서치바 백그라운드 컬러
            textfield.backgroundColor = .white
            //플레이스홀더 글씨 색 정하기
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.keepinGray3])
            //서치바 텍스트입력시 색 정하기
            textfield.textColor = .black
            
            if let leftView = textfield.leftView as? UIImageView {
            leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
            //이미지 틴트컬러 정하기
            leftView.tintColor = UIColor.keepinGray3
            }
        }
        searchBar.backgroundImage = UIImage()
    }
    
    //MARK: - @objc Methods
    @objc func dismissScreen(){
        self.dismiss(animated: true, completion: nil)
    }


}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension SearchVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = PresentDetailVC()
        nextVC.keepinIdx = (filteredData[indexPath.row]?._id)!
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(nextVC, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if filteredData.isEmpty && load{
            stackview.isHidden = true
            return 0
        }
        else{
            stackview.isHidden = false
            return filteredData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = searchResultCV.dequeueReusableCell(withReuseIdentifier: "PresentMoaCVC", for: indexPath) as? PresentMoaCVC else {
            
            return UICollectionViewCell()
            
        }
        
        cell.presentImage.setImage(with: (filteredData[indexPath.row]?.photo)!)
        cell.presentTitle.text = filteredData[indexPath.row]?.title
        cell.presentDate.text = filteredData[indexPath.row]?.date

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 10
        let collectionViewSize = collectionView.frame.size.width - padding
                
        return CGSize(width: collectionViewSize/2, height: 228)
    }
    
    
}

//MARK: - Server Functions
extension SearchVC : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        let glassIcon = textFieldInsideSearchBar?.leftView as! UIImageView
        glassIcon.image = glassIcon.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        
        filteredData = []
        if searchBar.text == ""{
            load = false
            glassIcon.tintColor = .keepinGray3
            stackview.isHidden = false
            categoryView.isHidden = false
            searchBarDivider.image = UIImage(named: "lineSearchDefault")
        }
        else{
            load = true
            for present in presentList
            {
                if ((present?.title?.contains(searchText)) == true)
                {
                    filteredData.append(present)
                }
            }
            glassIcon.tintColor = .keepinBlack
            categoryView.isHidden = true
            searchBarDivider.image = UIImage(named: "lineSearchActive")
        }
        
        self.searchResultCV.reloadData()
    }
}

extension SearchVC {
    func didSuccessSearch(message: String) {
        searchResultCV.register(PresentMoaCVC.nib(), forCellWithReuseIdentifier: "PresentMoaCVC")
        searchResultCV.delegate = self
        searchResultCV.dataSource = self
        
        var frame: CGRect = self.searchResultCV.frame
        frame.size.height = self.searchResultCV.contentSize.height
        self.searchResultCV.frame = frame

        let itemNum : Int = (self.serverData?.keepins.count)!
        
        for i in 0...itemNum-1{
            presentList.append(serverData?.keepins[i])
        }
    }
    
    func failedToRequest(message: String) {
        print(message)
    }
}
