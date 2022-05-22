//
//  WeatherDetailViewModel.swift
//  WeatherForecast
//
//  Created by Prabakaran on 18/05/22.
//

import Foundation

protocol IWeatherDetailViewModel {
}

protocol WeatherDetailViewModelDelegate: AnyObject {
}

class WeatherDetailViewModel {
    var foreCast: Forecast!
    weak var delegate: WeatherDetailViewModelDelegate?
}
