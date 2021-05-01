//
//  WeatherInfoTableViewCell.swift
//  WeatherApp
//
//  Created by Ramakrishna Raju M on 4/24/21.
//

import UIKit

class WeatherInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temparatureLabel: UILabel!

    func configure(weather: Weather) {
        self.weatherLabel.text = weather.condition
        self.temparatureLabel.text = "Temp: \(weather.temperature)"
    }
}
