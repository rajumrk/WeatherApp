//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ramakrishna Raju M on 4/21/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func lookUpButtonTappedAction(sender: UIButton) {
        ApiCall.getWeather(forCity: cityTextField.text ?? "") { (response) in
            DispatchQueue.main.async {
                guard let listView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "WeatherListViewController") as? WeatherListViewController else {
                    return
                }
                listView.viewModel.weatherArray = response
                listView.viewModel.CityName = self.cityTextField.text?.capitalized ?? "City"
                self.navigationController?.pushViewController(listView, animated: true)
            }
        }
    }
}


