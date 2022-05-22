//
//  SearchResultViewModel.swift
//  WeatherForecast
//
//  Created by Prabakaran on 18/05/22.
//

import Foundation

protocol ISearchResultViewModel {
}

protocol SearchResultViewModelDelegate: AnyObject {
}

class SearchResultViewModel {
    var cityName: String = ""
    var foreCastInfo: ForecastModel!
    var selectedforeCastItem: Forecast!
    weak var delegate: SearchResultViewModelDelegate?
}
