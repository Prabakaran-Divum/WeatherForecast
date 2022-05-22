//
//  SearchViewContainerView+UITableView.swift
//  WeatherForecast
//
//  Created by Prabakaran on 22/05/22.
//

import Foundation
import UIKit
extension SearchViewContainerView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCellSetups.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableViewCellSetups[indexPath.row].createTableViewCell(indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
