//
//  SearchViewContainer.swift
//  WeatherForecast
//
//  Created by Prabakaran on 18/05/22.
//

import UIKit
protocol ISearchViewContainerView {
    func setupTableViewCellSetups()
}

protocol SearchViewContainerViewDelegate: AnyObject {
    func searchForecastRequest(cityName: String)
}

class SearchViewContainerView: UIView {
    static let identifier = String(describing: SearchViewContainerView.self)
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var tableViewCellSetups: [TableViewCellSetup] = []
    weak var delegate: SearchViewContainerViewDelegate?


    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(SearchViewContainerView.identifier, owner: self, options: nil)
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
    
    func setupSearchContainerView() {
        setupTableViewCellSetups()
        reloadTableView()
    }

    func reloadTableView() {
        tableViewCellSetups.sort(by: { $0.index < $1.index })
        tableView.reloadData()
    }
}
