//
//  Forecast.swift
//  weather
//
//  Created by cui on 2023/4/17.
//

import Foundation

struct Forecast: Codable {
    
    var adcode: String
    var casts: [Live]
    var city: String
    var province: String
    var reporttime: String
}
