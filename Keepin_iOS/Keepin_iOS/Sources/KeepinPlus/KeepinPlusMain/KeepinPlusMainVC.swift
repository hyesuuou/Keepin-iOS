//
//  KeepinPlusMainVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/08/23.
//

import Lottie
import UIKit
import YPImagePicker

class KeepinPlusMainVC: UIViewController {
    
    public static let identifier = "KeepinPlusMainVC"
    
    // 선택된 경우 -> 1, 선택x -> 0
    public static var numberList : [Int] = [0, 0, 0, 0, 0, 0, 0, 0]
    var count : Int = 0
    var selectedFriend: [Friend]?
    
    /// 받은 선물, 준 선물 - true: 받은 / false: 준
    var take: Bool = true
    
    @IBOutlet weak var lottieContainerView: UIView!
    
    // MARK: - Lottie
    lazy var lottieView : AnimationView = {
        let animationView = AnimationView(name: "keepin")
        animationView.frame = CGRect(x: 0, y: 0,
                                     width: UIScreen.main.bounds.width,
                                     height: 500)
        animationView.frame.origin.x = 0
        animationView.frame.origin.y = 156
        animationView.contentMode = .scaleAspectFill
        animationView.stop()
        animationView.isHidden = true
        return animationView
    }()

    
    // MARK: - IBOutlet
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
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var memoTextView: UITextView!
    @IBOutlet weak var memoTextViewHeight: NSLayoutConstraint!
    @IBOutlet weak var keepinLabel: UILabel!
    @IBOutlet weak var keepinLabelTopConstraint: NSLayoutConstraint!
    
    /// 사진 추가 관련
    @IBOutlet weak var imageStackviewHeight: NSLayoutConstraint!
    @IBOutlet var selectedImageView: [UIImageView]!
    @IBOutlet weak var imageAddButton: UIButton!
    
    
    /// 키보드 영역 관련 뷰
    @IBOutlet weak var keyboardView: UIView!
    @IBOutlet weak var keyboardViewHeight: NSLayoutConstraint!
    
    
    
    // MARK:- View Life Cycle
    
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBarUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KeepinPlusMainVC.numberList = [0, 0, 0, 0, 0, 0, 0, 0]
        print("viewDidLoad 실행")
        setUI()
        imageAddButton.addTarget(self, action: #selector(showPicker), for: .touchUpInside)
        //self.view.addSubview(self.lottieView)
        self.lottieContainerView.addSubview(self.lottieView)
        
        /// 필수값 변경 감지
        nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged) // 제목
        // friendNameButton.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .allEvents)// 친구
        //friendNameButton.titleLabel.addGestureRecognizer(#selector(self.textFieldDidChange(_:)))
        //friendNameButton.titleLabel?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.textFieldDidChange(_:))))
        // 이미지
        dateTextfield.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingDidEnd) // 날짜
    }
    
    // MARK:- UI
    func setUI(){
        
        /// titleLabel UI
        for index in 0...6 {
            titleLabel[index].font =  UIFont.GmarketSansTTF(.medium, size: 16)
        }
        
        /// underline UI
        //        for index in 0...2 {
        //            underlineView[index].backgroundColor = .keepinGray3
        //        }
        if nameTextField.text != "" {
            underlineView[0].backgroundColor = .keepinBlack
        } else {
            underlineView[0].backgroundColor = .keepinGray3
        }
        
        if dateTextfield.text != "" {
            underlineView[2].backgroundColor = .keepinBlack
        } else {
            underlineView[2].backgroundColor = .keepinGray3
        }
        
        if friendNameButton.titleLabel?.text != "친구의 이름을 입력해주세요." {
            print("친구의 이름이 입력되었을때")
            underlineView[1].backgroundColor = .keepinBlack
        } else {
            underlineView[1].backgroundColor = .keepinGray3
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
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "selectFriend"), object: nil)
        
        /// 선물 카테고리 선택
        for i in 0 ... 7 {
            categoryButton[i].addTarget(self, action: #selector(selectCategoryClicked(_:)), for: .touchUpInside)
        }
        
        setMemoUI()
        setKeyboardViewUI()
        setImageUI()
        
        /// datePicker 추가
        dateTextfield.setDatePicker(target: (Any).self)
        
        /// 키핀하기 로티뷰
        keepinLabel.font = UIFont.GmarketSansTTF(.medium, size: 20)
        keepinLabelTopConstraint.constant = UIScreen.main.bounds.height * (129/812)
    }
    
    // MARK: 네비게이션바 UI
    func setNavigationBarUI(){
        self.navigationController?.navigationBar.isHidden = true
        
        /// 키핀하기 추가 버튼 초기 UI
        /// 다 채워져 있으면 (ex. 수정)
        if nameTextField.text != "",
           friendNameButton.titleLabel?.text != "친구의 이름을 입력해주세요.",
           dateTextfield.text != "",
           selectedImageView[0].image != nil {
            addButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 16)
            addButton.tintColor = .keepinGreen
        }
        else {
            /// 채워져있지 않으면
            addButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 16)
            addButton.tintColor = .keepinGray3
        }
    }
    
    // MARK: 사진 등록부분 UI
    func setImageUI(){
        imageStackviewHeight.constant = (UIScreen.main.bounds.width - 48 - 20) / 3
        
        
    }
    
    // MARK: 받은선물, 준선물 ButtonUI
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
    
    //MARK: 카페고리 UI
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
    
    // MARK: 더 잘 키핀해볼까요? UI
    func setMemoUI(){
        memoTextView.layer.cornerRadius = 12
        memoTextView.layer.borderWidth = 1
        memoTextView.layer.borderColor = UIColor.keepinGray3.cgColor
        
        memoTextView.textContainerInset = UIEdgeInsets(top: 16, left: 18, bottom: 16, right: 18)
        setPlaceHolder()
        memoTextView.isScrollEnabled = false
    }
    
    // MARK: 키보드 관련 뷰 UI
    func setKeyboardViewUI(){
        self.dismissKeyboardWhenTappedAround()
        keyboardView.backgroundColor = .clear
        keyboardViewHeight.constant = 0
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK:- Server Connect
    func serverConnect(){
        
    }
    
    // MARK:- objc func
    // MARK: textField값 변경 감지
    @objc func textFieldDidChange(_ sender: Any?) {
        if nameTextField.text != "",
           friendNameButton.titleLabel?.text != "친구의 이름을 입력해주세요.",
           dateTextfield.text != "",
           selectedImageView[0].image != nil {
            addButton.setTitleColor(.keepinGreen, for: .normal)
        }
        else {
            addButton.setTitleColor(.keepinGray3, for: .normal)
        }
        
        /// 입력값 -> 밑줄 색 변경
        if nameTextField.text != "" {
            underlineView[0].backgroundColor = .keepinBlack
        } else {
            underlineView[0].backgroundColor = .keepinGray3
        }
        
        if dateTextfield.text != "" {
            underlineView[2].backgroundColor = .keepinBlack
        } else {
            underlineView[2].backgroundColor = .keepinGray3
        }
    }
    
    // MARK: 친구선택 관련
    @objc
    func loadList(_ notification : NSNotification)
    {
        print("loadList 실행", notification.object as! [Friend])
        var s = ""
        let addList = notification.object as! [Friend]
        selectedFriend = addList
        for i in notification.object as! [Friend] {
            if i.name == addList[addList.count-1].name{
                s += "\(i.name)"
            }
            else {
                s += "\(i.name), "
            }
        }
        friendNameButton.setTitle(s, for: .normal)
        friendNameButton.setTitleColor(.black, for: .normal)
        
        if addList.count != 0 {
            underlineView[1].backgroundColor = .keepinBlack
        } else {
            underlineView[1].backgroundColor = .keepinGray3
        }
        
        
        if s != "",
           nameTextField.text != "",
           dateTextfield.text != "",
           selectedImageView[0].image != nil {
            addButton.setTitleColor(.keepinGreen, for: .normal)
        }
        else {
            addButton.setTitleColor(.keepinGray3, for: .normal)
        }
        
    }
    
    // 선물 카테고리 버튼 눌렀을 때
    @objc
    func selectCategoryClicked(_ sender : UIButton){
        print(sender.tag)
        
        count = 0
        for i in 0 ... KeepinPlusMainVC.numberList.count - 1 {
            if KeepinPlusMainVC.numberList[i] == 1 {
                count = count + 1
            }
        }
        
        if count == 2 {
            if KeepinPlusMainVC.numberList[sender.tag] == 1 {
                KeepinPlusMainVC.numberList[sender.tag] = 0
            }
        }
        
        if count < 2 {
            KeepinPlusMainVC.numberList[sender.tag] = abs(KeepinPlusMainVC.numberList[sender.tag]-1)
        }
        setCategoryUI(select: KeepinPlusMainVC.numberList)
        
    }
    
    // MARK: 키보드 이슈 관련
    /// 키보드가 보이면
    @objc
    func keyboardWillShow(_ sender: Notification) {
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            keyboardViewHeight.constant = keyboardHeight
        }
    }
    
    /// 키보드가 보이지 않으면
    @objc
    func keyboardWillHide(_ sender: Notification) {
        keyboardViewHeight.constant = 0
    }
    
    // MARK: YPImagePicker
    @objc
    func showPicker() {
        var config = YPImagePickerConfiguration()
        
        config.showsPhotoFilters = false
        config.shouldSaveNewPicturesToAlbum = true
        config.startOnScreen = .library
        config.wordings.libraryTitle = "갤러리"
        config.maxCameraZoomFactor = 2.0
        config.library.maxNumberOfItems = 3
        config.gallery.hidesRemoveButton = false
        config.hidesBottomBar = false
        config.hidesStatusBar = false
        config.overlayView = UIView()
        
        let picker = YPImagePicker(configuration: config)
        
        picker.didFinishPicking { [unowned picker] items, cancelled in
            
            if cancelled {
                picker.dismiss(animated: true, completion: nil)
                return
            }
            
            var i : Int = 0
            
            for item in items {
                switch item {
                case .photo(let photo):
                    self.selectedImageView[i].image = photo.image
                    
                case .video(let video):
                    print(video)
                }
                
                i = i+1
            }
            self.imageAddButton.isHidden = true
            picker.dismiss(animated: true)
        }
        present(picker, animated: true, completion: nil)
    }
    
    // MARK:- IBAction
    // MARK: X 버튼 클릭 (뒤로가기)
    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    // MARK: 키핀하기 버튼 클릭
    @IBAction func addButtonClicked(_ sender: Any) {
        
        /// 필수요소가 다 채워져 있으면
        if nameTextField.text != "",
           friendNameButton.titleLabel?.text != "친구의 이름을 입력해주세요.",
           dateTextfield.text != "",
           selectedImageView[0].image != nil
           {
            postServer()
            self.lottieContainerView.isHidden = false
            self.lottieView.isHidden = false
            self.lottieView.play()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                self.lottieView.isHidden = true
                self.lottieView.stop()
                self.dismiss(animated: true) {
                    self.lottieContainerView.isHidden = true
                }
            }
        }
        else {
            /// 다 채워져 있지 않으면
            print("키핀하기 필수값 입력 필요")
        }
      
    }
    
    // MARK: 받은 선물 클릭
    @IBAction func selectGetButtonClicked(_ sender: Any) {
        setButtonUI(select: 0)
        take = true
    }
    
    // MARK: 준 선물 클릭
    @IBAction func selectGiveButtonClicked(_ sender: Any) {
        setButtonUI(select: 1)
        take = false
    }
    
    // MARK: 누구에게 받은/준 선물인가요? 클릭
    @IBAction func friendButtonClicked(_ sender: Any) {
        ///화면전환
        self.navigationController?.pushViewController(SelectFriendVC(), animated: true)
    }
    
    
}

// MARK:- 더 잛 키핀해볼까요? 부분 extension
extension KeepinPlusMainVC: UITextViewDelegate {
    
    /// placeholder 설정
    func setPlaceHolder(){
        memoTextView.delegate = self
        memoTextView.text = "선물을 주고받은 상황, 느낌 등을 기록해 보세요!"
        memoTextView.textColor = .keepinGray3
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.keepinGray3 {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "선물을 주고받은 상황, 느낌 등을 기록해 보세요!"
            textView.textColor = UIColor.keepinGray3
        }
    }
    
    // MARK: 글자수 제한
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let str = textView.text else { return true }
        let newLength = str.count + text.count - range.length
        return newLength <= 200
    }
    
    // MARK: textview 높이 자동조절
    func textViewDidChange(_ textView: UITextView) {
        
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { (constraint) in
            if estimatedSize.height <= 180 {
                
            }
            else {
                if constraint.firstAttribute == .height {
                    constraint.constant = estimatedSize.height
                }
            }
        }
    }
    
}

extension KeepinPlusMainVC {
    
    // MARK: - Server
    func postServer(){
        print("post Server 실행")
        
        /// friendIdxList 만들기
        var friendIdxList: [String] = []
        for friend in selectedFriend! {
            friendIdxList.append(friend.id)
        }
        
        /// category List 만들기
        var categoryList: [String] = []
        var categoryIndex = 0
        
        for category in KeepinPlusMainVC.numberList {
            if category == 1 {
                switch categoryIndex {
                case 0: categoryList.append("생일")
                case 1: categoryList.append("기념일")
                case 2: categoryList.append("축하")
                case 3: categoryList.append("칭찬")
                case 4: categoryList.append("응원")
                case 5: categoryList.append("감사")
                case 6: categoryList.append("깜짝")
                case 7: categoryList.append("기타")
                default:
                    return
                }
            }
            categoryIndex += 1
        }
        
        /// image List
        var imgList: [UIImage] = []
        for imgView in selectedImageView {
            if imgView.image != nil {
                imgList.append(imgView.image!)
            }
        }
        
        /// record
        var record: String = memoTextView.text!
        if record == "선물을 주고받은 상황, 느낌 등을 기록해 보세요!" {
            record = ""
        }
        
        print(friendIdxList)
        print("category: ", categoryList)
        
        // MARK: Server Connect Code
        KeepinAddService.shared.postKeepin(title: nameTextField.text!,
                                           taken: take,
                                           date: dateTextfield.text!.replacingOccurrences(of: ".", with: "-"),
                                           category: categoryList,
                                           record: record,
                                           friendIdx: friendIdxList,
                                           imageData: imgList) { result in
            
            switch result {
            case .success(let msg):
                print("success", msg)
                
            case .requestErr(let msg):
                print("requestERR", msg)
            case .pathErr:
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
        }
        
    }
}
