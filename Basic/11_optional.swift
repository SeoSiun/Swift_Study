/* 옵셔널 */
// 값이 있을수도 있고 없을 수도 있음 (옵셔널 타입 == nil 가능!)
// 옵셔널이 아닌 상수에 nil 값을 할당하려고 하면 컴파일 오류 발생

// 옵셔널은 nil의 가능성을 명시적으로 표현해주는 것
// nil의 가능성을 문서화 하지 않아도 코드만으로 충분히 표현 가능 -> 문서/주석 작성 시간을 절약
// 전달받은 값이 옵셔널이 아니라면 nil 체크를 하지 않더라도 안심하고 사용할 수 있게 됨 -> 효율적인 코딩이 가능해지고, 예외상황을 최소화하는 안전한 코딩이 가능해짐

// 옵셔널은 enum(열거형)과 general의 합작품
// enum Optional<Wrapped> : ExpressibleByNilLiteral {
//    case none
//    case some(Wrapped)

// 아래 둘은 같은 의미 Int?에서 ?를 반드시 붙여서 써야함
// let optionalValue: Optional<Int> = nil
// let optionalValue: Int? = nil

import Swift

//MARK:- 암시적 추출 옵셔널 (!)
// Implicitly Unwrapped Optional

var implicitlyUnwrappedOptionalValue: Int! = 100

switch implicitlyUnwrappedOptionalValue {
case .none: //값이 없는 경우
    print("This Optional variable is nil")
case .some(let value):  //값이 있는 경우
    print("Value is \(value)")
}

// 기존 변수처럼 사용 가능
implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1

// nil 할당 가능
implicitlyUnwrappedOptionalValue = nil

// 잘못된 접근으로 인한 런타임 오류 발생 (nil에 접근하려고 해서)
//implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1



//MARK:- 옵셔널 (?)
// Optional

var optionalValue: Int? = 100

switch optionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// nil 할당 가능
optionalValue = nil

// 기존 변수처럼 사용불가 - 옵셔널과 일반 값은 다른 타입이므로 연산불가
//optionalValue = optionalValue + 1
