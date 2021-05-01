//
//  WeatherDetailsViewController.swift
//  WeatherApp
//
//  Created by Ramakrishna Raju M on 4/24/21.
//

import UIKit

class WeatherDetailsViewController: UIViewController {

    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temparatureLabel: UILabel!
    @IBOutlet weak var weatherDetailLabel: UILabel!
    @IBOutlet weak var temparatureFeelsLikeLabel: UILabel!
    var weatherObject: Weather!

    var viewModel = WeatherDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureWeatherDetails()
        // Do any additional setup after loading the view.
    }
    

    func configureWeatherDetails() {
        self.weatherLabel.text = viewModel.weatherObject.condition
        self.weatherDetailLabel.text = viewModel.weatherObject.details
        self.temparatureLabel.text = viewModel.weatherObject.temperature
        self.temparatureFeelsLikeLabel.text = viewModel.weatherObject.tempFeelsLike
    }    
}

extension Dictionary {
    mutating func switchKey(fromKey: Key, toKey: Key) {
        if let entry = removeValue(forKey: fromKey) {
            self[toKey] = entry
        }
    }
}
