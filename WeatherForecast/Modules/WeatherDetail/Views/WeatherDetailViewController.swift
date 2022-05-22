//
//  WeatherDetailViewController.swift
//  WeatherForecast
//
//  Created by Prabakaran on 18/05/22.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    @IBOutlet weak var weatherDetailContainerView: WeatherDetailContainerView!
    let weatherDetailViewModel = WeatherDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWeatherDetailContainer()
        // Do any additional setup after loading the view.
    }
    
    private func setupWeatherDetailContainer() {
        weatherDetailContainerView.setupWeatherDetailViewContainer(foreCastItem: weatherDetailViewModel.foreCast)
    }
    
    

}
