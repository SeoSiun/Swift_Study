/* 인스턴스 생성과 소멸 */

// 이니셜라이저와 디이니셜라이저
// init, deinit

import Swift

//MARK: - 프로퍼티 기본값

// 스위프트의 모든 인스턴스는 초기화와 동시에
// 모든 프로퍼티에 유효한 값이 할당되어 있어야 합니다
// 프로퍼티에 미리 기본값을 할당해두면
// 인스턴스가 생성됨과 동시에 초기값을 지니게 됩니다
// 기본값을 넣어놓지 않으면 오류가 발생

class PersonA {
    // 모든 저장 프로퍼티에 기본값 할당
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "nick"
}

let jason: PersonA = PersonA()
jason.name = "jason"
jason.age = 30
jason.nickName = "j"


//MARK: - 이니셜라이저

// 프로퍼티 기본값을 지정하기 어려운 경우에는
// 이니셜라이저를 통해
// 인스턴스가 가져야 할 초기값을 전달할 수 있습니다

class PersonB {
    var name: String
    var age: Int
    var nickName: String
    
    // 이니셜라이저
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let hana: PersonB = PersonB(name: "hana", age: 20, nickName: "하나")

//let hana: PersonB = PersonB(name: "hana", age: 20, nickName: "")

//MARK: 프로퍼티의 초기값이 꼭 필요 없을 때
// 옵셔널을 사용!

class PersonC {
    var name: String
    var age: Int
    var nickName: String?   // 꼭 필요한 프로퍼티는 아니다라는 의미를 주고 싶을 때 옵셔널을 사용
    
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        // init(name: name, age: age)로 해도 된다.
        // 이때 init을 호출하는 애를 init이 아니라 convenience init으로 해줘야 한다.
        
        self.nickName = nickName
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let jenny: PersonC = PersonC(name: "jenny", age: 10)
let mike: PersonC = PersonC(name: "mike", age: 15, nickName: "m")

// 암시적 추출 옵셔널은
// 인스턴스 사용에 꼭 필요하지만
// 초기값을 할당하지 않고자 할 때 사용

class Puppy {
    var name: String
    var owner: PersonC!     //프로퍼티가 꼭 필요할 때 (초기화할 때 전달되기 어려운 값인 경우 사용)
    
    init(name: String) {
        self.name = name
    }
    
    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 합니다")
    }
}

let happy: Puppy = Puppy(name: "happy")
// 강아지는 주인없이 산책하면 안돼요!
//happy.goOut() // 주인이 없는 상태라 오류 발생
happy.owner = jenny
happy.goOut()
// happy가 주인 jenny와 산책을 합니다


//MARK: 실패가능한 이니셜라이저
// 이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우
// 인스턴스 생성에 실패할 수 있습니다
// 인스턴스 생성에 실패하면 nil을 반환합니다
// 그래서 실패가능한 이니셜라이저의 반환타입은 옵셔널 타입입니다

class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age: Int) {
        if (0...120).contains(age) == false {
            return nil
        }
        
        if name.characters.count == 0 {
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

//let john: PersonD = PersonD(name: "john", age: 23)    -> 실패가능한 이니셜라이저이기 때문에 옵셔널 타입으로 해야함
let john: PersonD? = PersonD(name: "john", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 123)
let batman: PersonD? = PersonD(name: "", age: 10)

print(joker) // nil
print(batman) // nil

//MARK: - 디이니셜라이저

// deinit은 클래스의 인스턴스가
// 메모리에서 해제되는 시점에 호출됩니다
// 인스턴스가 해제되는 시점에 해야할 일을 구현할 수 있습니다

class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC
    
    init(name: String, child: PersonC) {
        self.name = name
        self.child = child
    }
    
    //클래스 타입에만 구현할 수 있다, 매개변수를 가질 수 없다.
    deinit {
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE? = PersonE(name: "donald", child: jenny)
donald?.pet = happy
donald = nil // donald 인스턴스가 더이상 필요없으므로 메모리에서 해제됩니다
// donald가 jenny에게 happy를 인도합니다
