//
//  SearchResultViewController+SearchResultContainerView.swift
//  WeatherForecast
//
//  Created by Prabakaran on 22/05/22.
//

import Foundation
import UIKit

extension SearchResultViewController: SearchResultContainerViewDelegate {
    func onSelectedForeCastItem(foreCastItem: Forecast) {
        searchResultViewModel.selectedforeCastItem = foreCastItem
        self.performSegue(withIdentifier: Segue.weatherDetailSegue.rawValue, sender: self)
    }
}
