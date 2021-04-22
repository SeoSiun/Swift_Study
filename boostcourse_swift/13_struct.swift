/* 구조체 */
// swift는 대부분의 타입이 구조체로 이루어져 있을 정도로 구조체가 굉장히 중요한 역할을 담당함
// 구조체는 타입을 정의하는 것이기 때문에 이름에 대문자 camel case를 사용

import Swift

//MARK: - 정의

//struct <#이름#> {
//    /* <#구현부#> */
//}


//MARK: 프로퍼티 및 메서드
// 프로퍼티는 struct안에 들어가는 instance 변수 -> 어떤 타입 안에 들어있는 변수 : 프로퍼티
// 메서드는 구조체 안의 함수 -> 어떤 타입 안에 들어있는 함수 : 메서드

struct Sample {
    // 가변 프로퍼티 - 값을 변경할 수 있다.
    var mutableProperty: Int = 100
    
    // 불변 프로퍼티 - 값을 변경할 수 없다.
    let immutableProperty: Int = 100
    
    // 타입 프로퍼티 - Sample이라는 struct에서 사용할 수 있다.
    // cf) 가변/불변 프로퍼티는 인스턴스 프로퍼티
    static var typeProperty: Int = 100
    
    // 인스턴스 메서드 - 인스턴스에서 사용할 수 있는 메서드
    func instanceMethod() {
        print("instance method")
    }
    
    // 타입 메서드
    static func typeMethod() {
        print("type method")
    }
}

//MARK: 구조체 사용

// 가변 인스턴스 - 내부 프로퍼티의 값들을 변경해줄 수 있다.
var mutable: Sample = Sample()

// 불변 프로퍼티는 인스턴스 생성 후 수정할 수 없습니다
// 컴파일 오류 발생
//mutable.immutableProperty = 200


// 불변 인스턴스
let immutable: Sample = Sample()

// 불변 인스턴스는 아무리 가변 프로퍼티라도
// 인스턴스 생성 후에 수정할 수 없습니다
// 컴파일 오류 발생
//immutable.immutableProperty = 200


// 타입 프로퍼티 및 메서드 - 구조체 타입 자체에서 사용할 수 있는 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

// 인스턴스에서는 타입 프로퍼티나 타입 메서드를 사용할 수 없습니다
// 컴파일 오류 발생
//mutable.typeProperty = 400
//mutable.typeMethod()


//MARK: - 학생 구조체

struct Student {
    // 가변 프로퍼티
    var name: String = "unknown"
    
    // 키워드도 `로 묶어주면 이름으로 사용할 수 있습니다
    var `class`: String = "Swift"
    
    // 타입 메서드
    static func selfIntroduce() {
        print("학생타입입니다")
    }
    
    // 인스턴스 메서드
    // self는 인스턴스 자신을 지칭하며, 몇몇 경우를 제외하고 사용은 선택사항입니다
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
}

// 타입 메서드 사용
Student.selfIntroduce() // 학생타입입니다

// 가변 인스턴스 생성
var yagom: Student = Student()
yagom.name = "yagom"
yagom.class = "스위프트"
yagom.selfIntroduce()   // 저는 스위프트반 yagom입니다

// 불변 인스턴스 생성
let jina: Student = Student()

// 불변 인스턴스이므로 프로퍼티 값 변경 불가
// 컴파일 오류 발생
//jina.name = "jina"
jina.selfIntroduce() // 저는 Swift반 unknown입니다
