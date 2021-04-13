/* 옵셔널 추출 */

// 옵셔널 바인딩 (Optional Binding)
// 옵셔널의 값을 꺼내오는 방법 중 하나
// nil 체크를 함과 동시에 안전하게 값을 추출할 수 있는 방식
// 값이 있는지 확인해서 있다면 꺼내오고 없다면 값을 꺼내오지 않고 지나침

// 강제 추출 (Force Unwrapping)
// 옵셔널의 값을 강제로 추출


import Swift

//MARK:- Optional Binding

func printName(_ name: String) {
    print(name)
}
var myName: String? = nil
//printName(myName)
// 전달되는 값의 타입이 다르기 때문에 컴파일 오류발생
// 옵셔널 타입은 일반 string과 다른 타입으로 취급됨

// if let 방식으로 추출하자!
if let name: String = myName {
    printName(name)
} else {
    print("myName == nil")
}

var yourName: String! = nil

if let name: String = yourName {
    printName(name)
} else {
    print("yourName == nil")
}
// name 상수는 if-let 구문 내에서만 사용가능합니다
// 상수 사용범위를 벗어났기 때문에 컴파일 오류 발생
//printName(name)


myName = "yagom"
yourName = nil

// ,를 사용해 한 번에 여러 옵셔널을 바인딩 할 수 있습니다
// 모든 옵셔널에 값이 있을 때만 동작합니다
if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
}
// yourName이 nil이기 때문에 실행되지 않습니다
yourName = "hana"
// yourName에 값을 할당하고 나면 실행됨
if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
}
// yagom and hana



//MARK:- Force Unwrapping

//func printName(_ name: String) {
//    print(name)
//}
//var myName: String? = nil

// 변수명 뒤에 !를 붙이면 옵셔널 값을 강제로 추출
printName(myName!) // yagom

myName = nil
//print(myName!)
// 강제추출시 값이 없으므로 런타임 오류 발생

// 암시적 추출 옵셔널 타입은 함수 호출 시 !를 붙이지 않아도 붙인 것과 같은 효과!
//var yourName: String! = nil
yourName = nil
//printName(yourName)
// nil 값이 전달되기 때문에 런타임 오류발생

// 강제추출 방식은 권장되는 방식은 아님
