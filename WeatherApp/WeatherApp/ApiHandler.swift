//
//  ApiHandler.swift
//  weather
//
//  Created by Ramakrishna Raju M on 4/21/21.
//

import Foundation

class ApiHandler {
    
    static let session = URLSession.shared
    
    class func executeRequest(request: URLRequest , completion: @escaping(Data?, URLResponse?, Error?) -> Void ) {
        session.dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
        }.resume()
    }
    
}
