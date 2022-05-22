//
//  ForecastModel.swift
//  WeatherForecast
//
//  Created by Prabakaran on 22/05/22.
//

import Foundation
struct ForecastModel: Codable {
    var statusCode: String
    var city: City
    var forecastList: [Forecast]
    enum CodingKeys: String, CodingKey {
        case statusCode = "cod"
        case city
        case forecastList = "list"
    }
}

struct Forecast: Codable {
    var weatherInfo: [Weather]
    var temperatureInfo: TemperatureInfo
    var dateAndTime: String

    enum CodingKeys: String, CodingKey {
        case temperatureInfo = "main"
        case weatherInfo = "weather"
        case dateAndTime = "dt_txt"
    }
}

struct Weather: Codable {
    var weatherId: Int
    var weatherCondition: String
    var weatherDescription: String
    var weatherIcon: String
    enum CodingKeys: String, CodingKey {
        case weatherId = "id"
        case weatherCondition = "main"
        case weatherDescription = "description"
        case weatherIcon = "icon"
        
    }
}

struct TemperatureInfo: Codable {
    var temperature: Float
    var feelsLike: Float
    var tempMin: Float
    var tempMax: Float
    var humidity: Int
    var pressure: Int
    var seaLevel: Int
    var grndLevel: Int
    var tempkf: Float

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity = "humidity"
        case pressure = "pressure"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case tempkf = "temp_kf"
    }
}

struct City: Codable {
    var cityId: Int64
    var cityName: String
    var country: String

    enum CodingKeys: String, CodingKey {
        case cityId = "id"
        case cityName = "name"
        case country
    }
}
