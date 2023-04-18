//
//  WeatherInfoViewController.swift
//  weather
//
//  Created by cui on 2023/4/17.
//

import UIKit
import Combine

class WeatherInfoViewController: UIViewController {

    var city: City?
        
    lazy var lives = [Live]()
    
    lazy var weatherTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
                    
        tableView.register(UINib(nibName: "WeatherInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherInfoTableViewCellIdentifier")

        return tableView
    }()
    
//    let url = "https://restapi.amap.com/v3/weather/weatherInfo?key=330b5279263de62e9691bd53478fec6f&city=110100&extensions=all"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = city?.name
        
        self.view.addSubview(weatherTableView)
        weatherTableView.frame = self.view.bounds
                
        getWeatherInfo()
        
    }
}

extension WeatherInfoViewController {
    private func getWeatherInfo() {
        guard let city = city else { return }
        let url = Weather.weather_url + "?city=\(city.abcode)"
        
        let publisher: AnyPublisher<Weather, Error> = APIManager().sendRequest(for: url)
        publisher.sink { completion in
            switch completion {
            case .finished:
                print("request completed")
                break

            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                break
            }
        } receiveValue: { value in
            if let forecast = value.forecasts.first {
                self.lives.append(contentsOf: forecast.casts)
            }
            self.weatherTableView.reloadData()
        }
    }
}

extension WeatherInfoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lives.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WeatherInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "WeatherInfoTableViewCellIdentifier") as! WeatherInfoTableViewCell
        cell.live = lives[indexPath.row]
        return cell
    }
}

extension WeatherInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
