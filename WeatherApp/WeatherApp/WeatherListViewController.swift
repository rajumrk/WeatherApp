//
//  WeatherListViewController.swift
//  WeatherApp
//
//  Created by Ramakrishna Raju M on 4/21/21.
//

import UIKit

class WeatherListViewController: UIViewController {
    
    @IBOutlet weak var weatherTableView: UITableView!

    let viewModel = WeatherViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.CityName
        // Do any additional setup after loading the view.
    }
    
}

extension WeatherListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "weatherInfo", for: indexPath) as? WeatherInfoTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(weather: viewModel.weatherArray[indexPath.row])
        return cell
    }
    
    
}

extension WeatherListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "WeatherDetailsViewController") as? WeatherDetailsViewController else {
            return
        }
        detailView.weatherObject = viewModel.weatherArray[indexPath.row]
        self.navigationController?.pushViewController(detailView, animated: true)
    }
}
