//
//  Weather.swift
//  weather
//
//  Created by cui on 2023/4/17.
//

import Foundation

struct Weather: Codable {

    static let weather_url = "/v3/weather/weatherInfo"
    
    var status: String
    var count: String
    var info: String
    var infocode: String
    var forecasts: [Forecast]
}
