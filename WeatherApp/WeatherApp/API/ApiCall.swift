//
//  ApiCall.swift
//  weather
//
//  Created by Ramakrishna Raju M on 4/24/21.
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

struct Constants  {
    static let apiKey = "65d00499677e59496ca2f318eb68c049"
}

