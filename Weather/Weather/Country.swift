//
//  Country.swift
//  Weather
//
//  Created by 서시언 on 2021/08/19.
//

import Foundation

//{"korean_name":"한국","asset_name":"kr"}

struct Country: Codable{
    let koreanName: String
    let assetName: String
    
    enum CodingKeys: String, CodingKey {
        case koreanName = "korean_name"
        case assetName = "asset_name"
    }
}
