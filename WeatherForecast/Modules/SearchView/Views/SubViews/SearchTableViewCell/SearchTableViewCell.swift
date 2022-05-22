//
//  SearchTableViewCell.swift
//  WeatherForecast
//
//  Created by Prabakaran on 22/05/22.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    static let identifier = String(describing: SearchTableViewCell.self)
    
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var foreCastButton: UIButton!
    
    var inputTextFieldChangedCallback: ((_ text: String, _ tag: Int) -> Void)?
    var foreCastButtonClickCallback: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func setupSearchTableViewCell() {
        setupTextField()
        setupForecastButton()
    }

    private func setupTextField() {
        cityName.delegate = self
    }

    func setupForecastButton() {
        foreCastButton.isEnabled = false
    }

    func enableForecastButton() {
        foreCastButton.isEnabled = true
    }

    func inputTextFieldChanged(_ text: String, _ tag: Int) {
        if text.count > 1 {
            enableForecastButton()
        } else {
            setupForecastButton()
        }
        inputTextFieldChangedCallback!(text, tag)
    }

    @IBAction func foreCastClickAction(_ sender: UIButton) {
        foreCastButton.isEnabled = false
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { [self] _ in
            foreCastButton.isEnabled = true
        }
        foreCastButton.resignFirstResponder()
        foreCastButtonClickCallback?()
    }
    
}
