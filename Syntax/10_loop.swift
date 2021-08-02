/* 반복문 */
// 주로 collection type과 함께 사용됨

import Swift

var integers = [1, 2, 3]
let people = ["yagom": 10, "eric": 15, "mike": 12]

//MARK: - for-in
// 다른 언어의 for each 구문과 유사

//for <#item#> in <#items#> {
//    <#code#>
//}

for integer in integers {
    print(integer)
}

// Dictionary의 item은 key와 value로 구성된 튜플 타입입니다
// name 자리에는 key, age 자리에는 value가 옴
for (name, age) in people {
    print("\(name): \(age)")
}



//MARK: - while

//while <#condition#> {
//    <#code#>
//}
// 조건문의 괄호는 생략가능

while integers.count > 1 {
    integers.removeLast()
}


//MARK: - repeat-while
// do while과 같음
// do 라는 키워드가 스위프트의 오류처리 구문에서 사용되기 때문에 do while이라는 키워드를 사용하지 않음

//repeat {
//    <#code#>
//} while <#condition#>

repeat {
    integers.removeLast()
} while integers.count > 0

