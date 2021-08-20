//
//  Detail.swift
//  Weather
//
//  Created by 서시언 on 2021/08/19.
//

import Foundation

//{
//   "city_name":"베를린",
//   "state":12,
//   "celsius":10.8,
//   "rainfall_probability":60
//}

struct CityInfo: Codable {
    let cityName: String
    let state: Int
    let celsius: Float
    let rainfallProbability: Int
    
    enum CodingKeys: String, CodingKey {
        case state, celsius
        case cityName = "city_name"
        case rainfallProbability = "rainfall_probability"
    }
    
    var getTemperature: String {
        return "섭씨 " + String(celsius) + "도 / 화씨 " + String(round((celsius * 1.8 + 32) * 10) / 10) + "도"
    }
    
    var getRainRate: String{
        return "강수확률 " + String(rainfallProbability) + "%"
    }
    
    var imageName: String{
        if(rainfallProbability < 30){
            return "sunny"
        }
        if(rainfallProbability < 60){
            return "cloudy"
        }
        if(celsius > 0){
            return "rainy"
        }
        return "snowy"
    }
}
