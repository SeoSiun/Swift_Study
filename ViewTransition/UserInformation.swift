//
//  UserInformation.swift
//  ViewTransition
//
//  Created by 서시언 on 2021/08/10.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    // shared 같이 자주사용되는 이름을 쓰면 해킹에 취약해진다..?
    
    var name: String?
    var age: String?
}
