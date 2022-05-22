//
//  TableViewCellSetup.swift
//  WeatherForecast
//
//  Created by Prabakaran on 22/05/22.
//

import UIKit
protocol TableViewCellSetup {
    var tableView: UITableView { get }
    var tableViewCellIdentifier: String { get }
    var index: Int { get }

    func registerTableViewCell()
    func createTableViewCell(indexPath: IndexPath) -> UITableViewCell
    func reloadViewWith<T>(data: T)
    func setupViewData(cell: UITableViewCell)
}

extension TableViewCellSetup {
    func registerTableViewCell() { tableView.register(UINib(nibName: tableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: tableViewCellIdentifier) }
    func reloadViewWith<T>(data: T) { }
    func setupViewData(cell: UITableViewCell) { }
}
