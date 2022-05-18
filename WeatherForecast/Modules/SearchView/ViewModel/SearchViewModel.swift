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
}

class SearchViewModel {
    weak var delegate: SearchViewModelDelegate?
}
