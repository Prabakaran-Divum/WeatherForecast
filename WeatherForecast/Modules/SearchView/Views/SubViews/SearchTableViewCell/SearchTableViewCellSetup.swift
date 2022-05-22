//
//  SearchTableViewCellSetup.swift
//  WeatherForecast
//
//  Created by Prabakaran on 22/05/22.
//

import Foundation
import UIKit
class SearchTableViewCellSetup: TableViewCellSetup {

    var tableView: UITableView
    var tableViewCellIdentifier: String = SearchTableViewCell.identifier
    var index: Int
    var cityName: String
    var inputTextFieldChangedCallback: ((_ text: String, _ tag: Int) -> Void)?
    var actionCallback: (() -> Void)?
    init(tableView: UITableView, index: Int) {
        self.tableView = tableView
        self.index = index
        self.cityName = ""
    }

    func createTableViewCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath)
        guard let searchTableViewCell = cell as? SearchTableViewCell else { return cell }
        searchTableViewCell.setupSearchTableViewCell()
        searchTableViewCell.foreCastButtonClickCallback = foreCastButtonCallback
        searchTableViewCell.inputTextFieldChangedCallback = inputTextFieldChanged
        return searchTableViewCell
    }

    func inputTextFieldChanged(_ text: String, _ tag: Int) {
        cityName = text
    }

    func foreCastButtonCallback() {
        actionCallback?()
    }
}
