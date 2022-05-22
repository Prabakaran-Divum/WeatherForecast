//
//  Constant+API.swift
//  WeatherForecast
//
//  Created by Prabakaran on 22/05/22.
//

import Foundation
struct Api {
    static var baseUrl: String {
        #if DEVELOPMENT
        return "https://api.openweathermap.org/data/2.5/"
        #else
        return "https://api.openweathermap.org/data/2.5/"
        #endif
    }
    
    static var WeatherIconBaseUrl: String {
        #if DEVELOPMENT
        return "https://openweathermap.org/img/wn/"
        #else
        return "https://openweathermap.org/img/wn/"
        #endif
    }
    
    static func endPoint(for api: ApiEndPoint) -> String { return api.value }
}
enum ApiEndPoint {
    case forecast
    fileprivate var value: String {
        switch self {
        case .forecast: return "forecast"
        }
    }
}
