//
//  WeatherDetailsViewController.swift
//  WeatherApp
//
//  Created by Ramakrishna Raju M on 4/21/21.
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
        self.weatherLabel.text = viewModel.weatherObject.weather[0].main
        self.weatherDetailLabel.text = viewModel.weatherObject.weather.description // Key name has to be changed as "description" is default
        self.temparatureLabel.text = String(viewModel.weatherObject.main.temp)
        self.temparatureFeelsLikeLabel.text = "Feels like \(String(describing: viewModel.weatherObject.main.feels_like))"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}

extension Dictionary {
    mutating func switchKey(fromKey: Key, toKey: Key) {
        if let entry = removeValue(forKey: fromKey) {
            self[toKey] = entry
        }
    }
}
