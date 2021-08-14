//
//  UserInformation.swift
//  SignUp
//
//  Created by 서시언 on 2021/08/14.
//

import Foundation
import UIKit

class UserInformation{
    static let shared: UserInformation = UserInformation()
    
    var id: String?
    var password: String?
    var intro: String?
    var image: UIImage?
    var phoneNum: String?
    var birth: String?
}
