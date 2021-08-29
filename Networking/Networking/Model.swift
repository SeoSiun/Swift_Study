//
//  Model.swift
//  Networking
//
//  Created by 서시언 on 2021/08/28.
//

import Foundation

struct APIResponse: Codable {
    let results: [Friend]
}

struct Friend: Codable {
    struct Name: Codable {
        let title: String
        let first: String
        let last: String
        
        var full: String {
            return self.title.capitalized + ". " + self.first.capitalized + " " + self.last.capitalized
        }
    }
    
    struct Picture: Codable {
        let large: String
        let mediun: String
        let thumbnail: String
    }
    
    let name: Name
    let email: String
    let picture: Picture
}
