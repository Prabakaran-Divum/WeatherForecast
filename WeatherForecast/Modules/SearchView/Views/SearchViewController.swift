//
//  SearchViewController.swift
//  WeatherForecast
//
//  Created by Prabakaran on 18/05/22.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchViewContainerView: SearchViewContainerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        WeatherManager.getForeCastInfo(with: "bangalore") { (weatherResponse, _ statusCode) in
            print("Weather Response=>",weatherResponse)
        } failure: { (error) in
        }
    }


}

