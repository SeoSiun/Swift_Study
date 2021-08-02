/* 타입캐스팅 */

// 스위프트의 타입캐스팅은
// 인스턴스의 타입을 확인하는 용도
// 또는 클래스의 인스턴스를
// 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지
// 확인하는 용도로 사용합니다
// is, as를 사용합니다

// let someInt: Int = 100
// let someDouble: Double = Double(someInt)   -> 타입캐스팅이 아님, Double instance를 하나 더 만들어 주는 것

import Swift

// 타입 캐스팅을 위한 클래스 정의
class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다 신남!")
    }
}

var yagom: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()


//MARK: - 타입 확인
// is를 사용하여 타입을 확인합니다

var result: Bool

result = yagom is Person // true
result = yagom is Student // false
result = yagom is UniversityStudent // false

result = hana is Person // true   -> 학생은 사람을 상속받아서 사람의 특성을 모두 가지기 때문에 사람임
result = hana is Student // true
result = hana is UniversityStudent // false

result = jason is Person // true
result = jason is Student // true
result = jason is UniversityStudent // true

if yagom is UniversityStudent {
    print("yagom은 대학생입니다")
} else if yagom is Student {
    print("yagom은 학생입니다")
} else if yagom is Person {
    print("yagom은 사람입니다")
} // yagom은 사람입니다

switch jason {
case is Person:
    print("jason은 사람입니다")
case is Student:
    print("jason은 학생입니다")
case is UniversityStudent:
    print("jason은 대학생입니다")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다")
} // jason은 사람입니다

switch jason {
case is UniversityStudent:
    print("jason은 대학생입니다")
case is Student:
    print("jason은 학생입니다")
case is Person:
    print("jason은 사람입니다")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다")
} // jason은 대학생입니다
// -> switch 사용시 자식클래스를 먼저 체크하자!

//MARK: - 업 캐스팅
// as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록
// 컴파일러에게 타입정보를 전환해줍니다
// Any 혹은 AnyObject로도 타입정보를 변환할 수 있습니다
// 암시적으로 처리되므로 생략해도 무방합니다

var mike: Person = UniversityStudent() as Person
var jenny: Student = Student()
//var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류
var jina: Any = Person() // as Any 생략가능

//MARK: - 다운 캐스팅
// as? 또는 as!를 사용하여
// 자식 클래스의 인스턴스로 사용할 수 있도록
// 컴파일러에게 인스턴스의 타입정보를 전환해줍니다

//MARK: 조건부 다운 캐스팅
// as?

var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent   // 실질적으로 할당된 값이 대학생이기 때문에 대학생으로 사용가능
optionalCasted = jenny as? UniversityStudent // nil
optionalCasted = jina as? UniversityStudent // nil
optionalCasted = jina as? Student // nil

//MARK: 강제 다운 캐스팅
// as!
// 런타임 오류가 발생할 수 있지만, 반환타입이 옵셔널이 아니고 일반 타입이다.

var forcedCasted: Student

optionalCasted = mike as! UniversityStudent     // 가능한 애한테 하는건 문제 없음
//optionalCasted = jenny as! UniversityStudent // 런타임 오류
//optionalCasted = jina as! UniversityStudent // 런타임 오류
//optionalCasted = jina as! Student // 런타임 오류


// 활용
func doSomethingWithSwitch(someone: Person) {
    switch someone {
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethingWithSwitch(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다 신남!
doSomethingWithSwitch(someone: mike) // 멤버쉽 트레이닝을 갑니다 신남!
doSomethingWithSwitch(someone: jenny) // 등교를 합니다
doSomethingWithSwitch(someone: yagom) // 숨을 쉽니다


func doSomething(someone: Person) {
    if let universityStudent = someone as? UniversityStudent {
        universityStudent.goToMT()
    } else if let student = someone as? Student {
        student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
}

doSomething(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: mike) // 멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: jenny) // 등교를 합니다
doSomething(someone: yagom) // 숨을 쉽니다
