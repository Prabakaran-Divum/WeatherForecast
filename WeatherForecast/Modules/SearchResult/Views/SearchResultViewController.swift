//
//  SearchResultViewController.swift
//  WeatherForecast
//
//  Created by Prabakaran on 18/05/22.
//

import UIKit

class SearchResultViewController: UIViewController {
    @IBOutlet weak var searchResultContainerView: SearchResultContainerView!
    let searchResultViewModel = SearchResultViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchViewContainerView()
        // Do any additional setup after loading the view.
    }

    private func setupSearchViewContainerView() {
        searchResultContainerView.delegate = self
        searchResultContainerView.setupSearchResultContainerView(foreCastInfo: searchResultViewModel.foreCastInfo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let weatherDetailViewController = segue.destination as?  WeatherDetailViewController {
            let cityName = searchResultViewModel.cityName
            navigationItem.backBarButtonItem = UIBarButtonItem(
                title: cityName, style: .plain, target: nil, action: nil)
            weatherDetailViewController.weatherDetailViewModel.foreCast = searchResultViewModel.selectedforeCastItem
        }
    }

}
