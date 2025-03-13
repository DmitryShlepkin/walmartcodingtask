//
//  CountryListVC+Search.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

import UIKit

extension CountryListVC: UISearchResultsUpdating {
        
    func updateSearchResults(for searchController: UISearchController) {
        debouncer.debounce { [weak self] in
            guard let text = self?.searchController.searchBar.text else { return }
            if text.count >= 3 {
                self?.viewModel.showFilteredList(by: text)
            } else {
                self?.viewModel.showFullList()
            }
        }
    }
        
}

extension CountryListVC: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.showFullList()
    }
    
}

