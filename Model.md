# Be-you 



## 데이터 모델

**CoreData** : 서버를 따로 구현하지 않기 때문에 CoreData를 사용해서 App정보들을 저장할 계획

| class/struct/enum | 역할                                                         |
| :---------------- | :----------------------------------------------------------- |
| `Users`           | - 사용자가 설정한 profileImage와 설정 값을 가지고 있는 class 타입 |
| `Days`            | - `Day` 를 배열로 가지는 class 타입                          |
| `Day`             | - 하루를 기록할 수 있는 데이터를 가지는 class 타입           |
| `ColorChips`      | - Emotion의 모든 감정들을 배열로 가지는 ColorChips property가 있는 class 타입 <br>- 색상을 추가하거나 삭제하는 메서드를 가진다 |
| `ColorChip`       | - `HappyColorChip` , `SadColorChip` , `AngryColorChip` 과 같은 enum 타입들을 case로 가지는 enum 타입 |
| `HappyColorChip`  | - `Happy` 감정의 ColorChip들의 RGB 값을 case로 가지는 enum 타입 |



### User

```swift
final class User {
	var profileImage: UIImage?
	var diaryOn: Bool? = true
	var hashtagOn: Bool? = true
}
```



### Days

```swift
final class Days {
	var list: [Day]
	var count: Int {
		return list.count 
	}
}
```



### Day

```swift
final class Day {
	var date: Date = Date()
	var hashtags: [String]?
	var color: UIColor?
	var diary: String?
}
```



### Colorchips

```swift
final class ColorChips {
	var colorChips = [ColorChip.list]

	func addColorChip() {
    // TODO
  }
  
  func deleteColorChip() {
    // TODO
  }
}
```



### ColorChip

```swift
enum ColorChip: CaseIterable {
	case HappyColorChip
	case AngryColorChip
	case SadColorChip
	// 추가 감정

	static let list: [ColorChip] = {
		var colorChips = [ColorChip]()
		for colorchip in ColorChip.allCases {
			colorChips.append(colorchip.list)
		}
		return colorChips
	}()	
}
```



### HappyColorChip

```swift
enum HappyColorChip: String, CaseIterable {
	case color1 = "RGB값"
	case color2 = ".."
	// 추가 컬러칩 색상

	static let list: [HappyColorChip] = {
		var happyColorChips = [HappyColorChip]()
		for happyColorChip in HappyColorChip.allCases {
			happyColorChips.append(happyColorChip)
		}
		return happyColorChips
	}()
}
```