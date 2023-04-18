//
//  CityListViewController.swift
//  weather
//
//  Created by cui on 2023/4/17.
//

import UIKit
import Combine

class CityListViewController: UIViewController {

    lazy var cities = [City]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCellIdentifier")
        
        return tableView
    }()
    
    lazy var publisher: AnyPublisher<[City], Error> = LocalHelper.loadLocalJSON(from: "city")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "城市列表"
        
        self.view.addSubview(tableView)
        tableView.frame = self.view.bounds
        
        publisher.sink { completion in
            switch completion {
            case .finished:
//                print("Loading completed")
                break
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                break
            }
        } receiveValue: { array in
            self.cities.append(contentsOf: array)
            self.tableView.reloadData()
        }
    }
}

extension CityListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCellIdentifier")!
        cell.textLabel?.text = cities[indexPath.row].name
        return cell
    }
}

extension CityListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WeatherInfoViewController()
        vc.city = cities[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
