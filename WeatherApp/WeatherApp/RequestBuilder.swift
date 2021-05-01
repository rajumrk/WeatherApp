//
//  RequestBuilder.swift
//  weather
//
//  Created by Ramakrishna Raju M on 4/21/21.
//

import Foundation

class RequestBuilder {
    
    class func getWeatherApiURLRequest(_ request: GetCityWeatherApiRequest) -> URLRequest? {
        guard let requestURL = URL(string: request.requestURL) else {
            return nil
        }
        if let parameters = request.urlParameters, parameters.count > 0 {
            let queryItems = parameters.map({
                URLQueryItem(name: $0.key, value: "\($0.value)")
            })
            guard var urlComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: false) else {
                return nil
            }
            urlComponents.queryItems = queryItems
            let percentEncodedQuery = (urlComponents.percentEncodedQuery.map { $0 + "&" } ?? "" )
            urlComponents.percentEncodedQuery = percentEncodedQuery
            return buildRequest(request: urlComponents.url, requestType: request)
        }
        return buildRequest(request: requestURL , requestType: request)
    }
    
    private class func buildRequest(request: URL? , requestType: GetCityWeatherApiRequest) -> URLRequest? {
        guard let url = request else {
            return nil
        }
        var urlRequest = URLRequest(url: url )
        urlRequest.httpMethod = requestType.HttpMethod
        let _ = requestType.headers.map ( {
            urlRequest.addValue($0.key, forHTTPHeaderField: $0.value)
        })
        return urlRequest
    }
}
