//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Ramakrishna Raju M on 4/24/21.
//

import Foundation

class WeatherViewModel {
    
    var weatherArray: [Weather] = []
    var numberOfRows: Int {
        return weatherArray.count
    }
}
