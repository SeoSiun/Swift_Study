/* 함수 */

import Swift

//MARK: - 함수의 선언
//MARK: 함수선언의 기본형태
//func <#함수이름#>(<#매개변수1이름#>:  <#매개변수1타입#>, <#매개변수2이름#>: <#매개변수2타입#> ...) -> <#반환타입#> {
//    <#함수 구현부#>
//    return <#반환값#>
//}
func sum(a: Int, b: Int) -> Int {
    return a + b
}



//MARK: 반환 값이 없는 함수
//func <#함수이름#>(<#매개변수1이름#>: <#매개변수1타입#>, <#매개변수2이름#>: <#매개변수2타입#> ...) -> Void {
//    <#함수 구현부#>
//    return
//}
func printMyName(name: String) -> Void {
    print(name)
}



//반환 타입 생략 가능
//func <#함수이름#>(<#매개변수1이름#>: <#매개변수1타입#>, <#매개변수2이름#>: <#매개변수2타입#> ...) {
//    <#함수 구현부#>
//    return
//}
func printYourName(name: String) {
    print(name)
}



//MARK: 매개변수가 없는 함수
//func <#함수이름#>() -> <#반환타입#> {
//    <#함수 구현부#>
//    return <#반환값#>
//}
func maximumIntegerValue() -> Int {
    return Int.max
}

//MARK: 매개변수와 반환값이 없는 함수
//func <#함수이름#>() -> Void {
//    <#함수 구현부#>
//    return
//}
func hello() -> Void {
    return print("hello")
}

//MARK: -함수의 호출
sum(a: 3, b:5) //8
printMyName(name: "siun") //siun
printYourName(name: "yagom") //yagom
maximumIntegerValue() //Int의 최댓값
hello() //hello


//MARK: - 매개변수 기본값
// 함수의 매개변수에 값이 들어오지 않아도 자동적으로 매개변수를 갖게 됨

// 기본값을 갖는 매개변수는 매개변수 목록 중에 뒤쪽에 위치하는 것이 좋습니다
//func <#함수이름#>(<#매개변수1이름#>: <#매개변수1타입#>, <#매개변수2이름#>: <#매개변수2타입#> = <#매개변수 기본값#> ...) -> <#반환타입#> {
//    <#함수 구현부#>
//    return <#반환값#>
//}

// me는 기본값으로 yagom을 가짐
func greeting(friend: String, me: String = "yagom") {
    print("Hello \(friend)! I'm \(me)")
}

// 매개변수 기본값을 가지는 매개변수는 생략할 수 있습니다
greeting(friend: "hana") // Hello hana! I'm yagom
greeting(friend: "john", me: "eric") // Hello john! I'm eric



//MARK: - 전달인자 레이블
// 전달인자 레이블은 함수를 호출할 때
// 매개변수의 역할을 좀 더 명확하게 하거나
// 함수 사용자의 입장에서 표현하고자 할 때 사용합니다

// 함수의 중복정의도 쉽게 할 수 있다. (전달인자 레이블을 사용하면 다른 이름의 함수같은 역할을 함)

//func <#함수이름#>(<#전달인자 레이블#> <#매개변수1이름#>: <#매개변수1타입#>, <#전달인자 레이블#> <#매개변수2이름#>: <#매개변수2타입#> ...) -> <#반환타입#> {
//    <#함수 구현부#>
//    return
//}

// 함수 내부에서 전달인자를 사용할 때에는 매개변수 이름을 사용해야 합니다
func greeting(to friend: String, from me: String) {
    print("Hello \(friend)! I'm \(me)")
}

// 함수를 호출할 때에는 전달인자 레이블을 사용해야 합니다
greeting(to: "hana", from: "yagom") // Hello hana! I'm yagom




//MARK: - 가변 매개변수
// 전달 받을 값의 개수를 알기 어려울 때 사용할 수 있습니다
// 가변 매개변수는 함수당 하나만 가질 수 있습니다
// 매개변수 타입 뒤에 ...을 넣으면 됨
//func <#함수이름#>(<#매개변수1이름#>: <#매개변수1타입#>, <#전달인자 레이블#> <#매개변수2이름#>: <#매개변수2타입#>...) -> <#반환타입#> {
//    <#함수 구현부#>
//    return
//}
func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)!"
}

print(sayHelloToFriends(me: "yagom", friends: "hana", "eric", "wing"))
// Hello ["hana", "eric", "wing"]! I'm yagom!

//가변인자에 전달인자가 없거나 nil을 넣으면 오류 -> 값을 넘기고 싶지 않다면 전달인자 레이블을 생략하면 됨
print(sayHelloToFriends(me: "yagom"))
// Hello []! I'm yagom!


/*
 위에 설명한 함수의 다양한 모양은 모두 섞어서 사용 가능합니다
 */




//MARK: - 데이터 타입으로서의 함수
// 스위프트는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어입니다
// 스위프트의 함수는 일급객체이므로 변수, 상수 등에 저장이 가능하고
// 매개변수를 통해 전달할 수도 있습니다


//MARK: 함수의 타입표현
// 반환타입을 생략할 수 없습니다
// (<#매개변수1타입#>, <#매개변수2타입#> ...) -> <#반환타입#>

// 변수에 함수를 넣을거에요
var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("eric", "yagom") // Hello eric! I'm yagom
// greeting을 실행한 것과 같은 결과!

someFunction = greeting(friend:me:)
someFunction("eric", "yagom") // Hello eric! I'm yagom


// 타입이 다른 함수는 할당할 수 없습니다
//someFunction = sayHelloToFriends(me: friends:)


// 함수 타입을 매개변수로 받을 수도 있다.
func runAnother(function: (String, String) -> Void) {
    function("jenny", "mike")
}

// Hello jenny! I'm mike
runAnother(function: greeting(friend:me:))

// Hello jenny! I'm mike
runAnother(function: someFunction)
