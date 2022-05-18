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
    weak var delegate: SearchResultViewModelDelegate?
}
