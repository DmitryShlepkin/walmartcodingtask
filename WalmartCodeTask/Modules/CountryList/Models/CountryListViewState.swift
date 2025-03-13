//
//  CountryListViewState.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

enum CountryListViewState: Equatable {
    
    case initial
    case loading(Content)
    case empty(Content)
    case success(Content)
    case error(Content)
    
    struct Content {
        
        let title: String
        let description: String
        let countries: [CountryListCellVM]?
        
        init(title: String, description: String) {
            self.title = title
            self.description = description
            self.countries = nil
        }
        
        init(title: String, description: String, countries: [CountryListCellVM]?) {
            self.title = title
            self.description = description
            self.countries = countries
        }
        
    }
        
    static func == (lhs: CountryListViewState, rhs: CountryListViewState) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial):
            return true
        case (.loading, .loading):
            return true
        case (.empty, .empty):
            return true
        case (.success, .success):
            return true
        case ( .error, .error):
            return true
        default:
            return false
        }
    }
    
}
