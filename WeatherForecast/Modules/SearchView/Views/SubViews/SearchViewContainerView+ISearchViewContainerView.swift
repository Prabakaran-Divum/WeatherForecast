//
//  SearchViewContainerView+ISearchViewContainerView.swift
//  WeatherForecast
//
//  Created by Prabakaran on 22/05/22.
//

import Foundation
extension SearchViewContainerView: ISearchViewContainerView {
    func setupTableViewCellSetups() {
        tableViewCellSetups.append(getSearchViewTableViewCellSetup(index: 0))
    }
    private func getSearchViewTableViewCellSetup(index: Int) -> SearchTableViewCellSetup {
        let searchTableViewCellSetup = SearchTableViewCellSetup(tableView: tableView, index: index)
        searchTableViewCellSetup.actionCallback = searchForeCastCallback
        searchTableViewCellSetup.registerTableViewCell()
        return searchTableViewCellSetup
    }

    private func searchForeCastCallback() {
        let searchTableViewCellSetup = tableViewCellSetups.filter({$0.tableViewCellIdentifier == SearchTableViewCell.identifier })
        guard let searchTableCellList = searchTableViewCellSetup as? [SearchTableViewCellSetup] else { return }
        let searchTableViewCell = searchTableCellList[0]
        let cityName = searchTableViewCell.cityName
        delegate?.searchForecastRequest(cityName: cityName)
    }
}
