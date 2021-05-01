//
//  ApiRequest.swift
//  weather
//
//  Created by Ramakrishna Raju M on 4/21/21.
//

import Foundation

class GetCityWeatherApiRequest {
    
    var cityName: String
    
    init(cityName: String) {
        self.cityName = cityName
    }
    
    var requestURL: String {
        return "https://api.openweathermap.org/data/2.5/forecast"
    }
    
    var urlParameters: [String: String]? {
        return ["q" : self.cityName , "appid": Constants.apiKey]
    }
    
    var HttpMethod: String {
        "GET"
    }
    
    var headers: [String: String] {
        return ["Cache-Control": "no-cache, no-store, max-age=0"]
    }
    
}
