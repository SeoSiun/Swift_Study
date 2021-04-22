// 값 타입 vs 참조 타입
/* 클래스, 구조체/열거형 비교 */


/* Class */
// 전통적인 oop 관점에서의 클래스와 크게 다른 점은 없지만
// 단일 상속이 된다는 차이점이 있다
// 참조 타입
// Apple 프레임워크의 대부분의 큰 뻐대는 모두 클래스로 구성되어 있음


/* Struct */
// 다른 언어의 구조체보다 다양한 기능
// 상속 불가
// 값 타입
// swift의 대부분의 큰 뼈대는 모두 구조체로 구성


/* Enum */
// Enumeration
// 유사한 종류의 여러 값을 유의미한 이름으로 한 곳에 모아서 정의
// 다른 언어의 열거형과는 많이 다른 존재
// 상속 불가
// 값 타입
// 열거형 자체가 하나의 데이터 타입
// 열거형의 case 하나하나 전부 하나의 유의미한 값으로 취급됨
//      기존의 열거형의 case들이 전부 정수값으로 취급되던 것과는 다른 모습!


// 위 세 가지 중 Class만 유일하게 참조 타입이고, 상속 가능
// extension은 세 가지 모두에 적용 가능


/* 구조체는 언제 사용하나? */
// 연관된 몇몇의 값들을 모아서 하나의 데이터 타입으로 표현하고 싶을 때 -> 클래스와 별 차이가 없음
// 다른 객체 또는 함수 등으로 전달될 때 참조가 아닌 복사를 원할 때 -> 클래스와의 차이점 (값 타입이기 때문)
// 자신을 상속할 필요가 없거나 자신이 다른 타입의 상속을 받을 필요가 없을 때
// Apple 프레임워크에서 프로그래밍을 할 때에는 주로 클래스를 많이 사용


/* Value vs Reference */
//   Value   : 데이터를 전달할 때 값을 복사하여 전달
// Reference : 데이터를 전달할 때 값의 메모리 위치를 전달해서 단순히 참조 값을 전달함


import Swift

//MARK:- Class vs Struct/Enum

struct ValueType {
    var property = 1
}

class ReferenceType {
    var property = 1
}

let firstStructInstance = ValueType()
var secondStructInstance = firstStructInstance
secondStructInstance.property = 2

print("first struct instance property : \(firstStructInstance.property)")    // 1
print("second struct instance property : \(secondStructInstance.property)")  // 2
// 값 타입이므로 데이터가 그대로 복사되어 들어갔기 때문에
// 첫 번째 구조체 인스턴스와 똑같은 모양의 인스턴스가 하나 더 생성되어 두 번째 변수에 들어간 것
// 두 번째 거를 바꿔도 첫 번째에 영향 X


let firstClassReference = ReferenceType()
var secondClassReference = firstClassReference
secondClassReference.property = 2

print("first class reference property : \(firstClassReference.property)")    // 2
print("second class reference property : \(secondClassReference.property)")  // 2
// 두 번째거를 바꿨는데 첫 번째거도 바뀜
// 첫 번째와 두 번째가 하나의 같은 인스턴스를 가리키고 있음
// 데이터 전달시 값이 복사되는 것이 아니고 참조값이 전달되는 것!


// 스위프트는 구조체, 열거형 사용을 선호
// 애플 프레임워크는 대부분 클래스 사용
// 애플 프레임 워크 사용시 구조체/클래스 선택는 우리의 몫
