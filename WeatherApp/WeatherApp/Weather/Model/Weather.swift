//
//  Weather.swift
//  WeatherApp
//
//  Created by Ramakrishna Raju M on 4/24/21.
//

import Foundation

struct Weather: Codable {
    let clouds: Clouds
    let main: Main
    let weather: [WeatherInfo]
}

struct Clouds: Codable {
    let all: Int
}

struct Main: Codable {
    let feels_like: Float
    let temp: Float
    let humidity: Float
}

struct WeatherInfo: Codable {
    let detail: String
    let main: String
    
    enum CodingKeys: String, CodingKey {
       case main
       case detail = "description"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.main = try values.decode(String.self, forKey: .main)
        self.detail = try values.decode(String.self, forKey: .detail)
    }
    
}

extension Weather {
    
    var details: String? {
        guard let value = weather.first?.detail else { return nil }
        return value
    }
    
    var condition: String? {
        guard let value = weather.first?.main else { return nil }
        return value
    }
    
    var temperature: String { "\(main.temp)" }
    var tempFeelsLike: String { "Feels Like:  \(main.feels_like)" }

}
