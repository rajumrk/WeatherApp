//
//  ViewController.swift
//  WeatherApp
//
//  Created by Ramakrishna Raju M on 4/24/21.
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
                listView.title = self.cityTextField.text
                listView.viewModel.weatherArray = response
                self.navigationController?.pushViewController(listView, animated: true)
            }
        }
    }
}


