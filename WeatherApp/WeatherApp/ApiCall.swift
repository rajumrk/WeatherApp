//
//  ApiCall.swift
//  weather
//
//  Created by Ramakrishna Raju M on 4/21/21.
//

import Foundation

class ApiCall {
    
    static let shared = ApiCall()
    let session = URLSession.shared
    
    private init() {}

    static func getWeather(forCity:String, completion: @escaping ([Weather]) -> Void) {
        let request = GetCityWeatherApiRequest(cityName: forCity)
        guard  let urlRequest = RequestBuilder.getWeatherApiURLRequest(request) else {
            return
        }
        
        ApiHandler.executeRequest(request: urlRequest) { (data, respose, error) in
            guard error == nil else { return }
            guard let responseData = data else { return }

            do {
                let jsonDecoder = JSONDecoder()
                let result =  try jsonDecoder.decode(Response.self, from: responseData)
                print(result)
                completion(result.list)
            } catch {
                print(error)
            }
            
        }
    }
}


struct Response: Codable {
    let list: [Weather]
    
}

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
    let description: String
    let main: String
    let desc: String?
    init(description: String, main: String) {
        self.description = description
        self.main = main
        self.desc = description
    }
}
struct Constants  {
    static let apiKey = "65d00499677e59496ca2f318eb68c049"
}

