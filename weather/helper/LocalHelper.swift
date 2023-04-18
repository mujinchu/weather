//
//  LocalHelper.swift
//  weather
//
//  Created by cui on 2023/4/17.
//

import Foundation
import Combine

class LocalHelper {
    
    /// 读取本地JSON文件
    /// - Parameter filename: JOSN文件名
    /// - Returns: 回调
    static func loadLocalJSON<T: Codable>(from filename: String) -> AnyPublisher<T, Error> {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("Unable to find \(filename).json in bundle.")
        }
        
        let data = try! Data(contentsOf: url)
        
        return Just(data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
