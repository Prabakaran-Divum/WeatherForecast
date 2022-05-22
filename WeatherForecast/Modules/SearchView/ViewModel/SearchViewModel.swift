//
//  SearchViewModel.swift
//  WeatherForecast
//
//  Created by Prabakaran on 18/05/22.
//

import Foundation

protocol ISearchViewModel {
}

protocol SearchViewModelDelegate: AnyObject {
    func getForeCastSuccessResponse(_ statusCode: Int)
    func getForeCastFailureResponse(_ error: Error)
}

class SearchViewModel {
    var cityName: String = ""
    weak var delegate: SearchViewModelDelegate?
    var foreCastResponse: ForecastModel!

    func getForcastDetails(cityName: String) {
        self.cityName = cityName
        WeatherManager.getForeCastInfo(with: cityName) { (weatherResponse, _ statusCode) in
            print("Weather Response=>",weatherResponse)
            self.foreCastResponse = weatherResponse
            self.delegate?.getForeCastSuccessResponse(statusCode)
        } failure: { (error) in
            self.delegate?.getForeCastFailureResponse(error)
        }
    }
}
