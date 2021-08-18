# Keepin-iOS
씨워터삼준실버영의 사과를 키-핀🍎

**프로젝트 기간: 2021. 06. 26 ~ 2021. 07. 17** <br>
**보충&릴리즈준비 기간: 2021. 07. 18 이후**

<br>

## <img src="https://user-images.githubusercontent.com/68391767/124344822-b25d2100-dc0f-11eb-8f9c-7d4df0ed3647.png" width="30px"> Team Keepin

![image](https://user-images.githubusercontent.com/68391767/129841065-bd3f460c-e452-4b00-8c23-09ef76c60668.png)


**선물의 두근거림을 오래도록, 선물 아카이빙 서비스 Keepin 🎁**

잊어버리기 쉬운 감사한 순간들! 이제는 Keepin해 보세요.<br>
주고받은 선물들을 간직하고, 챙겨야 할 이벤트들을 리마인드하도록 도와드려요.

**Core Value**

> Keepin - 주고받은 선물을 보관하고 <br>
 Keepin mind - 그 순간의 마음을 간직하고 <br>
 Keepin touch - 다가오는 이벤트를 잘 챙길 수 있도록

<br>

### iOS Developer 

|ThreeJoon(최이준)|SilverYoung(이은영)|Seawater(김혜수)|
|:--:|:--:|:--:|
|<img src="https://user-images.githubusercontent.com/68391767/124344959-b2a9ec00-dc10-11eb-80eb-4ca985cc6301.png" width="150px">|<img src="https://user-images.githubusercontent.com/68391767/124344993-ebe25c00-dc10-11eb-9803-3bcef10bda35.png" width="150px">|<img src="https://user-images.githubusercontent.com/68391767/124344892-3dd6b200-dc10-11eb-9ad6-016fff33b616.png" width="150px">|

<br>

## Flow Chart

![image](https://user-images.githubusercontent.com/68391767/129840080-92014809-699f-443d-b9ec-c069c7521b76.png)

## Library

|라이브러리(Library)|목적(Purpose)|버전(Version)|
|:--:|:--:|:--:|
|Alamofire|서버통신|5.4|
|Kingfisher|이미지 처리|6.0|

<br>

## Convention

<details>
<summary>폴더링</summary>
<div markdown="1">

```
🗂 Configuration/

  - Constants.swift : API Constants 저장, 싱글턴으로 변수 생성

  - Base/ 🗂 : 뷰 컨트롤러에서 공통되는 부분 분리 (클래스 상속해서 사용)
			
    - BaseViewController.swift (ex. class HomeViewController: BaseViewController {} )

  - Extension/ 🗂 : Extension을 통해 기능 확장한 파일 저장

    - UIColor+.swift
    - UIButton+.swift
    - UIView+MakeAlert.swift
    - ...

  - Secret/ 🗂 : git에 올라가면 안되는 파일 저장 (ex. token)

  - CommonClass/ 🗂 : 커스텀 클래스, 스트럭트 저장
			
    - Device.swift : ex) 디바이스 크기, 여백 정보 담은 struct

🗂 Sources/
	
  - 뷰1/ 🗂  : 뷰 단위로 폴더링                       
		
    - HomeStoryboard.xib : xib 파일

    - HomeViewController.swift : 뷰 컨트롤러 (xib와 1대1 매칭)

    - Cell/ 🗂 : 셀 관련 파일 저장 like CollectionView Cells, TableView Cells 
      
      - (ex. ~CVC.swift, ~TVC.swift, ~CVC.xib, ~TVC.xib)
			
    - DataManager/ 🗂  : 네트워크 파일 저장 (ex. ~DataManager.swift)

    - DataModel/ 🗂 : 데이터 모델 저장 (ex. ~Request.swift - 보내는거, ~Response.swift - 받는거)
		
  - 뷰2/ 🗂
		
  - 뷰3/ 🗂
		
  - ...

- AppDelegate.swift

- SceneDelegate.swift

- Assets.xcassets

- LaunchScreen.storyboard

- Info.plist
```



</div>
</details>

<details>
<summary>Git 컨벤션</summary>
<div markdown="1">

  <br>
  커밋컨벤션: [커밋타입] #이슈번호 설명(한글)
  
  <br>
  
  
```
[feat] 기능추가시
[fix] 버그 수정
[docs] 문서 수정
[style] 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우
[refactor] 코드 리팩토링 (이해하기 쉬운 구조로 변경하며 기능의 변경은 없다.)
[test] 테스트 코드, 리팩토링 테스트 코드 추가
[chore] 빌드 업무 수정, 패키지 매니저 수정
  ```
  
 <br> 
  브랜치 전략
  <br>
  
  ```
  develop
  ㄴ dev_yijoon
  ㄴ dev_silver
  ㄴ dev_seawater
 ```
  
  <br>
  ISSUE: [prefix] description(한글로)
  <br>
  
  ```
  prefix 소문자
  description 한글
  ```
  
</div>
</details>

<details>
<summary>코드 컨벤션</summary>
<div markdown="1">

## 파일이름

- tableView - TV
- tableViewCell - TVC
- collectionView- CV
- collectionView Cell - CVC
- viewController - VC
- navigationController - NVC
- **파일이름앞에 꼭 뷰이름 붙이기!**

## **최대 줄 길이**

- 한 줄은 최대 99자를 넘지 않아야 합니다.

    Xcode의 **Preferences → Text Editing → Display**의 'Page guide at column' 옵션을 활성화하고 99자로 설정하면 편리합니다.

## **빈 줄**

- 빈 줄에는 공백이 포함되지 않도록 합니다.
- 모든 파일은 빈 줄로 끝나도록 합니다.
- MARK 구문 위와 아래에는 공백이 필요합니다.

    ```swift
    class{
    	//MARK: - Custom Variables
    	
    	
    	
    	//MARK: - IBOutlets

    	@IBOutlet
    	@IBOutlet
    	
    	//MARK: - LifeCycle Methods

    	override func viewDidLoad(){
    	
    	}
    	
    	//MARK: - Custom Methods
    	
    	//MARK: - @objc Methods
    	
    	//MARK: - IBActions
    }
    //MARK: - UITableViewDelegate

    //MARK: - UITableViewDatasource

    //MARK: - Server Functions
    ```

## **임포트**

모듈 임포트는 알파벳 순으로 정렬합니다. 내장 프레임워크를 먼저 임포트하고, 빈 줄로 구분하여 서드파티 프레임워크를 임포트합니다.

```swift
import UIKit

import SwiftyColor
import SwiftyImage
import Then
import URLNavigator
```

## **네이밍**

### **클래스**

- 클래스 이름에는 UpperCamelCase를 사용합니다.
- 클래스 이름에는 접두사Prefix를 붙이지 않습니다.

### **함수**

- 함수 이름에는 lowerCamelCase를 사용합니다.
- Action 함수의 네이밍은 '주어 + 동사 + 목적어' 형태를 사용합니다. **지키면 좋다**
    - Tap(눌렀다 뗌)*, clicked는  `UIControlEvents`의 `.touchUpInside`에 대응하고, *Press(누름)*는 `.touchDown`에 대응합니다.
    - will~*은 특정 행위가 일어나기 직전이고, *did~*는 특정 행위가 일어난 직후입니다.
    - should~*는 일반적으로 `Bool`을 반환하는 함수에 사용됩니다.

    **좋은 예:**

    ```swift
    func backButtonDidTap() {
      // ...
    }
    ```

    **나쁜 예:**

    ```swift
    func back() {
      // ...
    }
    func pressBack() {
      // ...
    }
    ```

### **변수**

- 변수 이름에는 lowerCamelCase를 사용합니다.

### **상수**

- 상수 이름에는 lowerCamelCase를 사용합니다.

    **좋은 예:**

    ```swift
    let maximumNumberOfLines = 3
    ```

    **나쁜 예:**

    ```swift
    let kMaximumNumberOfLines = 3
    let MAX_LINES = 3
    ```

### **열거형**

- enum의 각 case에는 lowerCamelCase를 사용합니다.

    **좋은 예:**

    ```swift
    enum Result {
      case .success
      case .failure
    }
    ```

    **나쁜 예:**

    ```swift
    enum Result {
      case .Success
      case .Failure
    }
    ```

### **약어**

- 약어로 시작하는 경우 소문자로 표기하고, 그 외의 경우에는 항상 대문자로 표기합니다.

    **좋은 예:**

    ```swift
    let userID: Int?
    let html: String?
    let websiteURL: URL?
    let urlString: String?
    ```

    **나쁜 예:**

    ```swift
      let userId: Int?
      let HTML: String?
      let websiteUrl: NSURL?
      let URLString: String?
    ```

    ### **Delegate**

    - Delegate 메서드는 프로토콜명으로 네임스페이스를 구분합니다.

        **좋은 예:**

        ```swift
        protocol UserCellDelegate {
          func userCellDidSetProfileImage(_ cell: UserCell)
          func userCell(_ cell: UserCell, didTapFollowButtonWith user: User)
        }
        ```

        **나쁜 예:**

        ```swift
        protocol UserCellDelegate {
          func didSetProfileImage()
          func followPressed(user: User)

          // `UserCell`이라는 클래스가 존재할 경우 컴파일 에러 발생
          func UserCell(_ cell: UserCell, didTapFollowButtonWith user: User)
        }
        ```

    ## **타입**

    - `Array<T>`와 `Dictionary<T: U>` 보다는 `[T]`, `[T: U]`를 사용합니다.

        **좋은 예:**

        ```swift
        var messages: [String]?
        var names: [Int: String]?
        ```

    ## **주석**

    - `//`를 사용해서 문서화에 사용되는 주석을 남깁니다.

        ```swift
        // 사용자 프로필을 그려주는 뷰
        class ProfileView: UIView {

          // 사용자 닉네임을 그려주는 라벨
          var nameLabel: UILabel!
        }
        ```

    ### UpperCamalCase

    - 클래스
    - 구조체
    - 익스텐션
    - 프로토콜
    - 열거형

    ### lowerCamelCase

    - 함수
    - 메서드
    - 인스턴스

</div>
</details>
  
<br>
  
## 역할분담

|분류|뷰이름|담당|구현|
|:--:|:--:|:--:|:--:|
|로그인|로그인 메인|김혜수|🎁|
  ||이메일 로그인|김혜수|🎁|
  |회원가입|회원가입 1|김혜수|🎁|
  ||회원가입 2|김혜수|🎁|
  |홈|홈 화면|김혜수|🎁|
  |선물 모아보기|모아보기 메인|최이준|🎁|
  ||모아보기 상세|최이준|🎁|
  ||상세보기 수정|최이준|🎁|
  |키핀하기|키핀하기|김혜수|🎁|
  ||친구선택|김혜수|🎁|
  |새친구등록|새친구등록|이은영|🎁|
  |리마인더|리마인더 메인|최이준|🎁|
  ||리마인더 등록|최이준|🎁|
  |검색|검색|최이준|🎁|
  |마이페이지|마이페이지 메인|이은영|🎁|
  ||마이페이지 상세|이은영|🎁|
  ||친구이름 수정|이은영|🎁|
  ||설정 및 프로필편집|이은영|🎁|
  
  <br>
	
## View
	
### 로그인
![image](https://user-images.githubusercontent.com/68391767/129845843-31856b7b-d02c-4d3c-abee-975e2203c75e.png)

### 회원가입
![image](https://user-images.githubusercontent.com/68391767/129845907-dbd27608-0e10-4afa-bd1a-690590876060.png)

### 홈
![image](https://user-images.githubusercontent.com/68391767/129845950-0cd89c8b-7a00-47fc-a94c-7350ac01584c.png)

### 선물 모아보기
![image](https://user-images.githubusercontent.com/68391767/129846674-31a60221-7247-4660-908f-3cd815e0dd08.png)

	
### 검색
![image](https://user-images.githubusercontent.com/68391767/129846037-af6ef092-b293-403c-9963-b425b9ca6544.png)

### 키핀하기
![image](https://user-images.githubusercontent.com/68391767/129846076-72ff22e7-4897-4316-b549-05c5ad245449.png)

### 친구검색
![image](https://user-images.githubusercontent.com/68391767/129846943-f7cee6d6-b48a-4587-af7e-d4a6dee38825.png)

	
### 리마인더
![image](https://user-images.githubusercontent.com/68391767/129846109-e8ac2303-3c22-484b-b0db-13895f626205.png)

### 마이페이지
![image](https://user-images.githubusercontent.com/68391767/129846242-959a1b33-de26-4acd-9696-0d9c0d8a2834.png)

	
### 새 친구 등록
![image](https://user-images.githubusercontent.com/68391767/129846327-7525af49-8385-465c-a6b2-13ad71fc2292.png)

	
### 설정
![image](https://user-images.githubusercontent.com/68391767/129846375-fc7f1711-dbf5-49ed-bb91-3ec8dfaab811.png)

	
