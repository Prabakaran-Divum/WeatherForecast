//
//  SearchResultTableViewCell.swift
//  WeatherForecast
//
//  Created by Prabakaran on 22/05/22.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    static let identifier = String(describing: SearchResultTableViewCell.self)
    
    @IBOutlet weak var dateAndTime: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var temprature: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupSearchResultTableViewCell(foreCastItem: Forecast) {
        print("foreCastItem===>",foreCastItem)
        dateAndTime.text = foreCastItem.dateAndTime
    
        if foreCastItem.weatherInfo.count > 0 {
            let weather = foreCastItem.weatherInfo[0]
            weatherType.text = weather.weatherCondition
        }
        let tempratureInCelsius = foreCastItem.temperatureInfo.temperature - APPLocalConfig.differenceCelsius
        temprature.text = "Temprature:  \(String(format: "%.2f", tempratureInCelsius)) C"
    }
}
