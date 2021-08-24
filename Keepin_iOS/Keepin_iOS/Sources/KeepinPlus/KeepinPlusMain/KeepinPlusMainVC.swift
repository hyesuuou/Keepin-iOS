//
//  KeepinPlusMainVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/08/23.
//

import UIKit

class KeepinPlusMainVC: UIViewController {
    
    public static let identifier = "KeepinPlusMainVC"
    
    // 선택된 경우 -> 1, 선택x -> 0
    public static var numberList : [Int] = [0, 0, 0, 0, 0, 0, 0, 0]

    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet var titleLabel: [UILabel]!
    @IBOutlet var underlineView: [UIView]!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet var categoryButton: [UIButton]!
    /// kindButton[0] : 받은 선물, kindButton[1]: 준 선물
    @IBOutlet var kindButton: [UIButton]!
    @IBOutlet weak var kindButtonWidth: NSLayoutConstraint!
    @IBOutlet weak var friendNameButton: UIButton!
    @IBOutlet weak var dateTextfield: UITextField!
    
    // MARK:- View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBarUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK:- UI
    func setUI(){
        
        /// titleLabel UI
        for index in 0...6 {
            titleLabel[index].font =  UIFont.GmarketSansTTF(.medium, size: 16)
        }
        
        /// underline UI
        for index in 0...2 {
            underlineView[index].backgroundColor = .keepinGray3
        }
        
        /// textfield UI
        nameTextField.font = UIFont.NotoSans(.regular, size: 16)
        dateTextfield.font = UIFont.NotoSans(.regular, size: 16)
        
        /// 받은선물, 준 선물 UI - 처음에 받은 선물에 체크
        setButtonUI(select: 0)
        
        setCategoryUI(select: KeepinPlusMainVC.numberList)
        
        
        /// 누구에게 받은/준 선물인가요 UI
        friendNameButton.tintColor = .keepinGray3
        friendNameButton.titleLabel?.font = UIFont.NotoSans(.regular, size: 16)
        
    }
    
    // MARK: 네비게이션바 UI
    func setNavigationBarUI(){
        self.navigationController?.navigationBar.isHidden = true
        
        addButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 16)
        addButton.tintColor = .keepinGray3
        
    }
    
    //MARK: 받은선물, 준선물 ButtonUI
    func setButtonUI(select : Int){
        
        // select가 0일 때 -> notSelect = 1-0 = 1
        // select가 1일 때 -> notSelect = 1-1 = 0
        let notSelect : Int = abs(1-select)
        
        // 선택된
        kindButton[select].tintColor = .white
        kindButton[select].backgroundColor = .keepinGreen
        kindButton[select].layer.borderWidth = 0
        
        kindButton[notSelect].tintColor = .keepinGray3
        kindButton[notSelect].backgroundColor = .white
        kindButton[notSelect].layer.borderWidth = 1
        kindButton[notSelect].layer.borderColor = UIColor.keepinGray3.cgColor
        
        kindButton[select].titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
        kindButton[notSelect].titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
       
        
        kindButton[select].layer.cornerRadius = 21.5
        kindButton[notSelect].layer.cornerRadius = 21.5
        
        kindButtonWidth.constant = UIScreen.main.bounds.width * (168/375)
        
    }
    
    func setCategoryUI(select : [Int]){
        
        for i in 0 ... 7 {
            if select[i] == 1 {
                categoryButton[i].tintColor = .white
                categoryButton[i].backgroundColor = .keepinGreen
                categoryButton[i].layer.borderWidth = 0
            }
            else {
                categoryButton[i].tintColor = .keepinGray3
                categoryButton[i].backgroundColor = .white
                categoryButton[i].layer.borderWidth = 1
                categoryButton[i].layer.borderColor = UIColor.keepinGray3.cgColor
            }
            categoryButton[i].layer.cornerRadius = 15
            categoryButton[i].titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
            
            
        }
        
    }
    
    // MARK:- Server Connect
    func serverConnect(){
        
    }
    
    // MARK:- objc func
    // 선물 카테고리 버튼 눌렀을 때
    
    // MARK:- IBAction
    // MARK: X 버튼 클릭 (뒤로가기)
    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // MARK: 키핀하기 버튼 클릭
    @IBAction func addButtonClicked(_ sender: Any) {
        serverConnect()
        self.dismiss(animated: true)
    }
    
    // MARK: 받은 선물 클릭
    @IBAction func selectGetButtonClicked(_ sender: Any) {
        setButtonUI(select: 0)
    }
    
    // MARK: 준 선물 클릭
    @IBAction func selectGiveButtonClicked(_ sender: Any) {
        setButtonUI(select: 1)
    }
    
}
