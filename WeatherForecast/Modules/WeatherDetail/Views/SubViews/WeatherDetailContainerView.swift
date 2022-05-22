//
//  WeatherDetailContainerView.swift
//  WeatherForecast
//
//  Created by Prabakaran on 18/05/22.
//

import UIKit

class WeatherDetailContainerView: UIView {
    static let identifier = String(describing: WeatherDetailContainerView.self)
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temprature: UILabel!
    @IBOutlet weak var tempratureFeels: UILabel!
    @IBOutlet weak var weatherCondition: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(WeatherDetailContainerView.identifier, owner: self, options: nil)
        setupContainerView()
    }
    
    private func setupContainerView() {
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func setupWeatherDetailViewContainer(foreCastItem: Forecast) {
        let weatherInfo = foreCastItem.weatherInfo[0]
        let imageUrl = "\(Api.WeatherIconBaseUrl)\(weatherInfo.weatherIcon)@2x.png"
        let url = URL(string: imageUrl)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async { [self] in
                weatherImage.image = UIImage(data: data!)
            }
        }
        let tempratureInCelsius = foreCastItem.temperatureInfo.temperature - APPLocalConfig.differenceCelsius
        let tempratureFeelsInCelsius = foreCastItem.temperatureInfo.feelsLike - APPLocalConfig.differenceCelsius
        temprature.text = "\(String(format: "%.2f", tempratureInCelsius)) C"
        tempratureFeels.text = "Feels Like: \(String(format: "%.2f", tempratureFeelsInCelsius)) C"
        weatherCondition.text = weatherInfo.weatherCondition
        weatherDescription.text = weatherInfo.weatherDescription
    }
}
