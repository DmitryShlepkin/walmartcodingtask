//
//  CountryListVC.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

import UIKit

final class CountryListVC: UIViewController {
    
    var viewModel: CountryListViewModeling
    let listView = CountryListView()
    let searchController = UISearchController(searchResultsController: nil)
    var debouncer = Debouncer(delay: 0.3)
        
    init(
        viewModel: CountryListViewModeling
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup(navigationTitle: "Countries")
        setup(navigationTitle: viewModel.navigationTitle)
        setUpdateViewDataHandler()
        Task {
            try await viewModel.getCountries()
        }
    }
    
    private func setUpdateViewDataHandler() {
        viewModel.updateState = { viewState in
            DispatchQueue.main.async { [weak self, viewState] in
                self?.listView.viewState = viewState
                self?.toggleSearchController(state: viewState)
            }
        }
    }
    
    private func toggleSearchController(state: CountryListViewState) {
        if state != .success(.init(title: "", description: "")) {
            navigationItem.searchController = nil
        } else {
            navigationItem.searchController = searchController
        }
    }
    
}
