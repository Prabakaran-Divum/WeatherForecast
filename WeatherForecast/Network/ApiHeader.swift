//
//  ApiHeader.swift
//  WeatherForecast
//
//  Created by Prabakaran on 22/05/22.
//

import Foundation
class ApiHeader {
    static let sharedInstance = ApiHeader()
    private init() {}
    func getApiHeaders() -> [String: String]? {
        let header: [String: String] = [
            "content-type": "application/json",
        ]
        return header
    }
}
