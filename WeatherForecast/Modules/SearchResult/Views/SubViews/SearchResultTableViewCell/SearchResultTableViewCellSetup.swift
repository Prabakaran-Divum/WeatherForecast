//
//  SearchResultTableViewCellSetup.swift
//  WeatherForecast
//
//  Created by Prabakaran on 22/05/22.
//

import Foundation
import UIKit
class SearchResultTableViewCellSetup: TableViewCellSetup {

    var tableView: UITableView
    var tableViewCellIdentifier: String = SearchResultTableViewCell.identifier
    var index: Int
    var foreCastItem: Forecast
    var inputTextFieldChangedCallback: ((_ text: String, _ tag: Int) -> Void)?
    var actionCallback: (() -> Void)?
    init(tableView: UITableView, index: Int, forecastItemDetail: Forecast) {
        self.tableView = tableView
        self.index = index
        self.foreCastItem = forecastItemDetail
    }

    func createTableViewCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath)
        guard let searchResultTableViewCell = cell as? SearchResultTableViewCell else { return cell }
        searchResultTableViewCell.setupSearchResultTableViewCell(foreCastItem: foreCastItem)
        return searchResultTableViewCell
    }
}
