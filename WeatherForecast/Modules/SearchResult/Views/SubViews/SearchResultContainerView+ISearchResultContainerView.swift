//
//  SearchResultContainerView+ISearchResultContainerView..swift
//  WeatherForecast
//
//  Created by Prabakaran on 22/05/22.
//

import Foundation
extension SearchResultContainerView: ISearchResultContainerView {
    func setupTableViewCellSetups() {
        for foreCastItem in foreCastList {
            tableViewCellSetups.append(getSearchResultTableViewCellSetup(index: 0, foreCastItem: foreCastItem))
        }
    }

    private func getSearchResultTableViewCellSetup(index: Int, foreCastItem: Forecast) -> SearchResultTableViewCellSetup {
        let searchResultTableViewCell = SearchResultTableViewCellSetup(tableView: tableView, index: index, forecastItemDetail: foreCastItem)
        searchResultTableViewCell.registerTableViewCell()
        return searchResultTableViewCell
    }
}
