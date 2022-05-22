//
//  SearchViewController.swift
//  WeatherForecast
//
//  Created by Prabakaran on 18/05/22.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchViewContainerView: SearchViewContainerView!
    let searchViewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchViewModel()
        setupSearchViewContainerView()
        setupNavigation()
        // Do any additional setup after loading the view.
    }
    
    private func setupNavigation() {
        self.navigationController?.navigationBar.topItem?.title = "ForeCast Search"
    }
    
    private func setupSearchViewModel() {
        searchViewModel.delegate = self
    }
    
    private func setupSearchViewContainerView() {
        searchViewContainerView.delegate = self
        searchViewContainerView.setupSearchContainerView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let searchResultViewController = segue.destination as?  SearchResultViewController {
            let cityName = searchViewModel.foreCastResponse?.city.cityName
            navigationItem.backBarButtonItem = UIBarButtonItem(
                title: cityName, style: .plain, target: nil, action: nil)

            searchResultViewController.searchResultViewModel.cityName = searchViewModel.cityName
            searchResultViewController.searchResultViewModel.foreCastInfo = searchViewModel.foreCastResponse
        }
    }
}
