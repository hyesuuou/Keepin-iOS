//
//  SearchVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/02.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchBarDivider: UIImageView!
    @IBOutlet weak var categoryView: UIView!
    
    @IBOutlet var categoryButton: [UIButton]!
    
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

    @IBOutlet weak var searchCV: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        setNavigationBar()
        setSearchBar()
    }
    
    func setNavigationBar(){
        let exitButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        exitButton.setImage(UIImage(named: "icX"), for: UIControl.State.normal)
        exitButton.addTarget(self, action: #selector(dismissScreen), for: UIControl.Event.touchUpInside)
        exitButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)

        let exitbarButton = UIBarButtonItem(customView: exitButton)
        let negativeSpacer:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: nil, action: nil)
            negativeSpacer.width = -20
//        self.navigationItem.leftBarButtonItems = [negativeSpacer,exitbarButton]
        self.navigationItem.leftBarButtonItem = exitbarButton
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc func dismissScreen(){
        self.dismiss(animated: true, completion: nil)
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

}

extension SearchVC : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        let glassIcon = textFieldInsideSearchBar?.leftView as! UIImageView
        glassIcon.image = glassIcon.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        
        if searchBar.text == ""{
            glassIcon.tintColor = .keepinGray3
            categoryView.isHidden = false
            searchBarDivider.image = UIImage(named: "lineSearchDefault")
        }
        else{
            glassIcon.tintColor = .keepinBlack
            categoryView.isHidden = true
            searchBarDivider.image = UIImage(named: "lineSearchActive")
        }
    }
}
