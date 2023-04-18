//
//  APIManager.swift
//  weather
//
//  Created by cui on 2023/4/17.
//

import Foundation
import Combine

class APIManager {
    func sendRequest<T: Codable>(for urlString: String) -> AnyPublisher<T, Error> {
        
        let fullUrl = HostConfig.dev_host + urlString + "&key=\(HostConfig.AMAP_KEY)&extensions=all"
        
        guard let url = URL(string: fullUrl) else {
            fatalError("invalid url \(fullUrl)")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global())
            .tryMap({ output -> Data in
                guard let httpResponse = output.response as? HTTPURLResponse,
                      200..<300 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            })
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
