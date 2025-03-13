//
//  CountryList+Setup.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

import UIKit

extension CountryListView {
    
    func setup() {
        backgroundColor = .white
    }
    
    func setupTableView() {
        addSubview(tableView)
        tableView.pin(to: self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150.0
        tableView.backgroundColor = .white
        tableView.register(
            CountryListCellView.self,
            forCellReuseIdentifier: CountryListCellView.identifier
        )
        tableView.reloadData()
    }
    
    func setupLoadingView() {
        addSubview(loadingView)
        loadingView.pin(to: self)
    }
    
    func setupEmptyView() {
        addSubview(emptyView)
        emptyView.pin(to: self)
    }
    
    func setupErrorView() {
        addSubview(errorView)
        errorView.pin(to: self)
    }
    
}
