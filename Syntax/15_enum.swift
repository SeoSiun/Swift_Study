/* 열거형 */
// 기존 다른 언어들의 열거형과는 다르게 강력한 기능을 가질 수 있음

import Swift

//MARK: - 정의

//enum은 타입이므로 대문자 카멜케이스를 사용하여 이름을 정의합니다
//각 case는 소문자 카멜케이스로 정의합니다
//각 case는 그 자체가 고유의 값입니다
//cf) c언어의 열거형에서는 case 별로 정수 값이 자동으로 할당되지만 스위프트는 그렇지 않다.

//enum <#이름#> {
//    case <#이름1#>
//    case <#이름2#>
//    case <#이름3#>, <#이름4#>, <#이름5#>
//    ...
//}


//MARK: 열거형 사용

enum Weekday {
    // 각각 한 줄씩 넣어도 되고
    case mon
    case tue
    case wed
    // 한 번에 여러 개를 넣어도 된다.
    case thu, fri, sat, sun
}

// (열거형이름).(case이름)으로 사용
var day: Weekday = Weekday.mon
day = .tue  // day는 Weekday로 지정되어 있으므로 열거형이름을 생략하고 사용할 수도 있다.

// var d = .mon
// -> 이렇게 사용하면 컴파일러는 어떤 열거형의 어떤 case인지 알 수 없음
// -> 처음 선언시 타입을 명시해줘야 생략가능

print(day) // tue

//case를 전부 적어주면 default를 할 필요 없음, 하나로도 빠진다면 default를 꼭 구현해야함
switch day {
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금 파티!!")
case .sat, .sun:
    print("신나는 주말!!")
}
// 평일입니다


//MARK: - 원시값

//C 언어의 enum처럼 정수값을 가질 수도 있습니다
//rawValue를 사용하면 됩니다
//case별로 각각 다른 값을 가져야합니다

// enum 열거형이름 : 원시값을 가질 타입
enum Fruit: Int {
    case apple = 0
    case grape = 1  // =1을 해주지 않아도 자동으로 1 증가된 값이 들어감
    case peach
    //    case mango = 0
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")
// Fruit.peach.rawValue == 2

//정수 타입 뿐만 아니라 Hashable 프로토콜을 따르는 모든 타입이 원시값의 타입으로 지정될 수 있습니다

enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university //String은 다음 값에 뭐가들어갈지 예측할 수 없으므로 얘의 rawValue는 case이름을 그대로 가져옴
}

print("School.middle.rawValue == \(School.middle.rawValue)")
// School.middle.rawValue == 중등

print("School.university.rawValue == \(School.university.rawValue)")
// School.university.rawValue == university


//MARK: 원시값을 통한 초기화

//rawValue를 통해 초기화 할 수 있습니다
//rawValue가 case에 해당하지 않을 수 있으므로
//rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입입니다 -> case가 없는 경우 생성이 되지 않아 nil이 나올 수 있기 때문

//let apple: Fruit = Fruit(rawValue: 0)
let apple: Fruit? = Fruit(rawValue: 0)

if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다")
} // rawValue 5에 해당하는 케이스가 없습니다


//MARK: 메서드

enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("따스한 봄~")
        case .jun, .jul, .aug:
            print("여름 더워요~")
        case .sep, .oct, .nov:
            print("가을은 독서의 계절!")
        case .dec, .jan, .feb:
            print("추운 겨울입니다")
        }
    }
}

Month.mar.printMessage()
// 따스한 봄~



//MARK: Associated value(연관값)
// 열거형 case에 원시값(raw value)를 저장하는 대신에 연관된 값을 저장할 수 있음
// 연관값은 원시값의 한계를 해결할 수 있음

// 원시값의 한계
// 모든 케이스가 동일한 형식을 사용해야 함
// 케이스 당 값을 하나밖에 저장할 수 없음
// 원시값 문자열에 숫자가 포함되어 있을 경우 숫자만 사용하려면 따로 추출해야하는 번거로움이 있음

// 원시값의 형식은 열거형이름 뒤에 선언하지만 연관값은 케이스 이름 뒤에 선언
// 선언 시점이 아닌 새로운 열거형을 생성할 때 값을 저장함
// 튜플을 사용해 하나의 케이스에 서로 다른 연관값들을 저장할 수 있음
/*
 enum enumName {
    case caseName(Type)
    case caseName(Type,Type, ...)
 }
 */

// 활용

// 정보를 원시값을 이용해 문자열로 저장
// 각 기기마다 저장할 값들이 다르고, 단순히 콤마(,)로 구분되어 있어 값 추출이 번거로움
enum AppleDevice: String {
    case iPhone = "X, 256GB"
    case iMac = "27, Pro, 300만원"
    case macBook = "Air, 1kg, 150만원"
}

// 위의 내용을 연관값을 활용해 바꾼 것
// 상황에 맞게 named 혹은 unnamed 튜플을 사용할 수 있다.
enum AppleDevice {
    case iPhone(model: String, storage: Int) // named tuple
    case iMac(size: Int, model: String, price: Int)
    case macBook(String, Int, Int) // unnamed tuple
}

// 연관값을 확인한 후 코드를 실행할 때는 주로 switch문 사용
var gift = AppleDevice.iPhone(model: "X", storage: 256)

switch gift {
case .iPhone(model: "X", storage: 256):
    print("iPhone X and 256GB")
case .iPhone(model: "X", _)
    // 와일드카드 패턴 사용 가능
    print("iPhone X")
case .iPhone:
    // 연관값 생략 가능
    print("iPhone")
case .iPhone(let model, let storage):
    // 블록 내부에서 연관값을 사용할 땐 상수로 바인딩
    // 값을 변경할 때는 var 로 변경가능
    print("iPhone \(model) and \(storage)GB")
case let .iMac(size, model, price):
    // 모든 연관값을 동일한 형태로 바인딩한다면
    // let 키워드를 열거형 케이스 앞에 표기하는 것도 가능
    print("iMac \(size), \(model), \(price)")
}

// 새로운 케이스를 할당할 경우 모두 새로운 값으로 교체됨
gift = .macBook("Air", 1, 150)

if case let .macBook(model, weight, price) = gift {
    print("maccBook \(model), \(weight)kg, \(price)")
}
