# Be-you 



## 데이터 모델

**CoreData** : 서버를 따로 구현하지 않기 때문에 CoreData를 사용해서 App정보들을 저장할 계획

| class/struct/enum | 역할                                                         |
| :---------------- | :----------------------------------------------------------- |
| `Users`           | - 사용자가 설정한 profileImage와 설정 값을 가지고 있는 class |
| `Days`            | - `Day` 를 배열로 가지는 class 타입                          |
| `Day`             | - 하루를 기록할 수 있는 데이터를 가지는 class 타입           |
| `Colorchips`      | - Emotion의 모든 감정들을 배열로 가지는 colorChips property가 있는 struct <br>- 색상을 추가하거나 삭제하는 메서드를 가진다 |
| `Emotion`         | - `Happy` , `Sad` , `Angry` 와 같은 enum 타입들을 가지는 enum |
| `Happy`           | - `Happy` 감정의 color chip의 RGB 값을 가지는 enum           |



### Users

- 고려한 사항
  - Singleton으로 생성하여 CoreData에 저장하려고 계획함
  - UserDefaults에 저장하고 CoreData에 저장하지 않기로함
    - 이때 앱이 삭제되고 재설치하면 설정과 이미지는 기본으로 사용하기로 결정

```swift
final class User {
	var profileImage: UIImage?
	var diaryOn: Bool? = true
	var hashtagOn: Bool? = true
}
```



### Days

- 고려한 사항
  - Singleton으로 생성하여 CoreData로부터 받아와서 앱 전체에서 사용하려고 계획함
  - 모든데이터를 다 가지기에는 너무 많다고 생각되어 기획에서 한 번에 며칠씩 받아서 사용할 지 결정 후 수정 필요 

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
	var date: Date()
	var hashtags: [String]?
	var color: String?
	var diary: String?
}
```



### Colorchips

```swift
struct ColorChips {
	var colorChips = [Emotion.list]

	mutating func addColorChip() {
    // TODO
  }
  
  mutating func deleteColorChip() {
    // TODO
  }
}

```



### Emotion

```swift
enum Emotion: CaseIterable {
	case Happy
	case Angry
	case Sad
	// 추가 감정

	static let list: [Emotion] = {
		var emotions = [Emotion]()
		for emotion in Emotion.allCases {
			emotions.append(emotion.list)
		}
		return emotions
	}()	
}
```



### Happy

```swift
enum Happy: String, CaseIterable {
	case color1 = "RGB값"
	case color2 = ".."
	// 추가 컬러칩 색상

	static let list: [Happy] = {
		var happys = [Happy]()
		for happy in Happy.allCases {
			happys.append(happy)
		}
		return happys
	}()
}
```

