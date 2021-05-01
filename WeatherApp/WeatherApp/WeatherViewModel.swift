//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Ramakrishna Raju M on 4/22/21.
//

import Foundation

class WeatherViewModel {
    
    var weatherArray: [Weather] = []
    var CityName: String!
    var numberOfRows: Int {
        return weatherArray.count
    }
}
