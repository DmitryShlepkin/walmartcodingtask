//
//  CountryListVC+Setup.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

extension CountryListVC {
    
    func setup() {
        view.backgroundColor = .white
        setupListView()
        setupSearchController()
    }
    
    func setup(navigationTitle: String) {
        setupNavigation(title: navigationTitle)
        setup()
    }
    
    func setupNavigation(title: String) {
        navigationItem.title = title
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func setupListView() {
        view.addSubview(listView)
        listView.pinWithSafeArea(to: view)
    }
    
    func setupSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        searchController.searchBar.placeholder = "Search school by name"
        navigationItem.searchController = searchController
    }
    
}
