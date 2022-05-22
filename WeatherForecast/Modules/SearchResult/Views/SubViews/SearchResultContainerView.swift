//
//  SearchResultContainerView.swift
//  WeatherForecast
//
//  Created by Prabakaran on 18/05/22.
//

import UIKit
protocol ISearchResultContainerView {
    func setupTableViewCellSetups()
}

protocol SearchResultContainerViewDelegate: AnyObject {
    func onSelectedForeCastItem(foreCastItem: Forecast)
}
class SearchResultContainerView: UIView {
    static let identifier = String(describing: SearchResultContainerView.self)
    @IBOutlet weak var containerView: UIView!
    var tableViewCellSetups: [TableViewCellSetup] = []
    @IBOutlet weak var tableView: UITableView!
    var foreCastList: [Forecast] = []
    weak var delegate: SearchResultContainerViewDelegate?

    
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
        setupTableView()
    }
    
    private func setupContainerView() {
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
    }

    func setupSearchResultContainerView(foreCastInfo: ForecastModel) {
        self.foreCastList = foreCastInfo.forecastList
        setupTableViewCellSetups()
        reloadTableView()
    }
    
    private func reloadTableView() {
        tableViewCellSetups.sort(by: { $0.index < $1.index })
        tableView.reloadData()
    }

}
