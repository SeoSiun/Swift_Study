/* 조건문 */

import Swift

let someInteger = 100

//MARK: - if-else

//소괄호()는 생략 가능, 중괄호{} 생략은 불가! (한 줄일 때도 생략 못함)
//if <#condition#> {
//    <#statements#>
//} else if <#condition#> {
//    <#statements#>
//} else {
//    <#statements#>
//}

if someInteger < 100 {
    print("100 미만")
} else if someInteger > 100 {
    print("100 초과")
} else {
    print("100")
} // 100

// 스위프트의 조건에는 항상 Bool 타입이 들어와야합니다
// someInteger는 Bool 타입이 아닌 Int 타입이기 때문에
// 컴파일 오류가 발생합니다
//if someInteger { }


//MARK: - switch

//switch <#value#> {
//case <#pattern#>:
//    <#code#>
//default:
//    <#code#>
//}

// 범위 연산자를 활용하면 더욱 쉽고 유용합니다
switch someInteger {
case 0:
    print("zero")
case 1..<100:   // ..: 이상 미만
    print("1~99")
case 100:
    print("100")
case 101...Int.max: // ...: 이상 이하
    print("over 100")
default:
    print("unknown")
} // 100

// 정수 외의 대부분의 기본 타입을 사용할 수 있습니다
switch "yagom" {
case "jake":
    print("jake")
case "mina":
    print("mina")
case "yagom":
    print("yagom!!")
default:
    print("unknown")
} // yagom!!

// 명확히 모든 case가 다 명시되지 않는한 default를 반드시 작성해야 한다.
// 명시적으로 break를 해주지 않아도 알아서 break가 걸림
// fallthrough라고 적어주면 break가 없는 것처럼 동작
