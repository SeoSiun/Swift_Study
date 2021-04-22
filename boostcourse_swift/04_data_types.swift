/* 기본 데이터 타입 */

import UIKit

// Swift의 기본 데이터 타입
// Bool, Int, UInt, Float, Double, Character, String

// Bool
var someBool: Bool = true
someBool = false
// someBool = 0 // 컴파일 오류발생
// someBool = 1 // 컴파일 오류발생
// Swift에서는 bool에 int를 넣을 수 없다.

// Int
var someInt: Int = -100
// someInt = 100.1 // 컴파일 오류발생
// int에 double 넣기 불가능

// UInt
var someUInt: UInt = 100
// someUInt = -100 // 컴파일 오류발생 (Unsigned int이므로)
// someUInt = someInt // 컴파일 오류발생 (int를 Uint로 자동 형변환해주지 않음)
//스위프트는 자료형에 민감

// Float
var someFloat: Float = 3.14
someFloat = 3
//실수자료형에 정수를 넣는건 가능하다

// Double
var someDouble: Double = 3.14
someDouble = 3
// someDouble = someFloat // 컴파일 오류발생

// Character - 한 글자, 유니코드로 표현할 수 있는 모든 문자를 넣어줄 수 있다.
var someCharacter: Character = "🇰🇷"
someCharacter = "😄"
someCharacter = "가"
someCharacter = "A"
// someCharacter = "하하하" // 컴파일 오류발생
print(someCharacter)

// String
var someString: String = "하하하 😄 "
someString = someString + "웃으면 복이와요"
print(someString)

// someString = someCharacter // 컴파일 오류발생

// 스위프트에서는 다른 자료형과 자료교환은 암시적는 불가능


someString = """
여러줄 문자열을
사용할 수 있습니다.
첫 줄에 겹따옴표 세 개,
마지막 줄에 겹따옴표 세 개를
사용하면 됩니다.
"""

someString = """
겹따옴표 세 개인 줄(첫줄, 끝줄)에서
줄 바꿈을 하지 않으면 오류가 발생합니다.
"""

/*
someString = """오류발생
오류발생"""
*/

