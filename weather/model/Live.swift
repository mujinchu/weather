//
//  Live.swift
//  weather
//
//  Created by cui on 2023/4/17.
//

import Foundation

struct Live: Codable {
    
    var date: String
    var daypower: String
    var daytemp: String
    var daytemp_float: String
    var dayweather: String
    var daywind: String
    var nightpower: String
    var nighttemp: String
    var nighttemp_float: String
    var nightweather: String
    var nightwind: String
    var week: String

    var weekStr: String {
        get {
            switch week {
            case "1":
                return "星期一"
            case "2":
                return "星期二"
            case "3":
                return "星期三"
            case "4":
                return "星期四"
            case "5":
                return "星期五"
            case "6":
                return "星期六"
            case "7":
                return "星期日"
            default:
                return "星期天"
            }
        }
    }
    
}
