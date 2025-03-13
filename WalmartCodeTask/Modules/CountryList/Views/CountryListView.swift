//
//  CountryListView.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

import UIKit

final class CountryListView: UIView {
        
    var viewState: CountryListViewState = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    var cellsData = [CountryListCellVM]()
    
    lazy var loadingView = LoadingView()
    lazy var emptyView = EmptyView()
    lazy var errorView = ErrorView()
    lazy var tableView = UITableView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        update(state: viewState)
    }
    
    private func update(state: CountryListViewState) {
        subviews.forEach { $0.removeFromSuperview() }
        switch viewState {
        case .initial:
            break
        case .loading(let loading):
            setupLoadingView()
            loadingView.updateWith(title: loading.title, description: loading.description)
            loadingView.playAnimation()
            break
        case .empty(let empty):
            setupEmptyView()
            emptyView.updateWith(title: empty.title, description: empty.description)
            break
        case .error(let error):
            setupErrorView()
            errorView.updateWith(title: error.title)
            break
        case .success(let success):
            cellsData = success.countries ?? []
            guard let count = success.countries?.count else { break }
            if count > 0 {
                setupTableView()
            } else {
                setupEmptyView()
                emptyView.updateWith(title: success.title, description: success.description)
            }
            break
        }
    }
    
}
