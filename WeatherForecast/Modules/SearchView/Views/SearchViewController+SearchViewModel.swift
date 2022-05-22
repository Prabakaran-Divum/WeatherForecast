//
//  SearchViewController+SearchViewModel.swift
//  WeatherForecast
//
//  Created by Prabakaran on 22/05/22.
//

import Foundation
import Toast_Swift
extension SearchViewController: SearchViewModelDelegate {
    func getForeCastSuccessResponse(_ statusCode: Int) {
        self.view.hideToastActivity()
        if statusCode == 200 {
            self.performSegue(withIdentifier: Segue.searchResultSegue.rawValue, sender: self)
        }
    }
    
    func getForeCastFailureResponse(_ error: Error) {
        self.view.hideToastActivity()
        self.view.makeToast("City not found")
    }
}
