//
//  SearchViewController+SearchViewContainerView.swift
//  WeatherForecast
//
//  Created by Prabakaran on 22/05/22.
//

import Foundation
import UIKit
import Toast_Swift

extension SearchViewController: SearchViewContainerViewDelegate {
    func searchForecastRequest(cityName: String) {
        self.view.makeToastActivity(.center)
        searchViewModel.getForcastDetails(cityName: cityName)
    }
}
