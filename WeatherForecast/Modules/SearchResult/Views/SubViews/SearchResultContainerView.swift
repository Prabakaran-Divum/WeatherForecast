//
//  SearchResultContainerView.swift
//  WeatherForecast
//
//  Created by Prabakaran on 18/05/22.
//

import UIKit

class SearchResultContainerView: UIView {
    static let identifier = String(describing: SearchResultContainerView.self)
    @IBOutlet weak var containerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(SearchResultContainerView.identifier, owner: self, options: nil)
        setupContainerView()
    }
    
    private func setupContainerView() {
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
