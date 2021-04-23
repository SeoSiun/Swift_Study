/* 옵셔널 체이닝 */

// 옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로
// 또다시 옵셔널이 연속적으로 연결되는 경우 유용하게 사용할 수 있습니다

import Swift

//MARK: - 옵셔널 체이닝

//MARK: 예제 클래스 및 인스턴스 생성

class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

let yagom: Person? = Person(name: "yagom")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")


// 옵셔널 체이닝이 실행 후 결과값이 nil일 수 있으므로
// 결과 타입도 옵셔널입니다

// 만약 우리집의 경비원의 직업이 궁금하다면..?

// 옵셔널 체이닝을 사용하지 않는다면... 복잡해요
func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직업은 \(guardJob)입니다")
                } else {
                    print("우리집 경비원은 직업이 없어요")
                }
            }
        }
    }
}

guardJob(owner: yagom)

//MARK: 옵셔널 체이닝 사용
// 옵셔널 체이닝을 사용한다면
func guardJobWithOptionalChaining(owner: Person?) {
    // 하나라도 잘못된 값이면 바로 멈추고 nil을 리턴 -> 잘못 접근할 일이 없다.
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다")
    } else {
        print("우리집 경비원은 직업이 없어요")
    }
}

guardJobWithOptionalChaining(owner: yagom)
// 우리집 경비원은 직업이 없어요


yagom?.home?.guard?.job // nil -> 집이 없으니까

yagom?.home = apart

yagom?.home // Optional(Apartment) - apart instance
yagom?.home?.guard // nil -> 경비원이 없으니까

yagom?.home?.guard = superman

yagom?.home?.guard // Optional(Person) - superman instance

yagom?.home?.guard?.name // Optional(String) - "superman"
yagom?.home?.guard?.job // nil -> 경비원의 직업이 없음

yagom?.home?.guard?.job = "경비원"



//MARK: - nil 병합 연산자
var guardJob: String

// ?? 앞에 값이 nil이면 ?? 뒤의 값을 리턴
guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"
print(guardJob) // 경비원

yagom?.home?.guard?.job = nil

guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"
print(guardJob) // 슈퍼맨
