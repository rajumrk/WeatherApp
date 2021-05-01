//
//  WeatherInfoTableViewCell.swift
//  WeatherApp
//
//  Created by Ramakrishna Raju M on 4/21/21.
//

import UIKit

class WeatherInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temparatureLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(weather: Weather) {
        self.weatherLabel.text = weather.weather[0].main
        self.temparatureLabel.text = "Temp \(weather.main.temp)"
    }
}
