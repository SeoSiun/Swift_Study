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
