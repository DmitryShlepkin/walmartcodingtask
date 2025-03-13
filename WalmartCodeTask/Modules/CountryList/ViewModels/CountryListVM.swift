//
//  CountryListVM.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

protocol CountryListViewModeling {
    var navigationTitle: String { get }
    var countries: [Country] { get }
    var updateState: ((CountryListViewState) -> Void)? { get set }
    func getCountries() async throws
    func showFullList()
    func showFilteredList(by searchText: String)
}

final class CountryListVM: CountryListViewModeling {
    
    enum EndPoints: String {
        case countries = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.jsonn"
    }
    
    private var networkManager: NetworkManaging

    var navigationTitle = "Countries"
    var updateState: ((CountryListViewState) -> Void)?
    var countries: [Country] = []
    
    init(networkManager: NetworkManaging) {
        self.networkManager = networkManager
    }
    
    func getCountries() async throws {
        
        /// Set loading state
        self.updateState?(.loading(.init(
            title: "Loading",
            description: "Please wait..."
        )))
        
        /// Request data from network
        let (list, error) = try await networkManager.fetch(
            url: EndPoints.countries.rawValue,
            as: [Country].self
        )
    
        /// Handle Error
        if (error) != nil {
            self.updateState?(.error(.init(
                title: "Network Error",
                description: "Please, try again later."
            )))
            return
        }
        
        /// Check Data
        guard let list else {
            self.updateState?(.error(.init(
                title: "Parse Error",
                description: "Please, try again later."
            )))
            return
        }
        
        /// Check Data count
        if list.count == 0 {
            self.updateState?(.empty(.init(
                title: "Empty",
                description: "Country list is empty."
            )))
        }

        /// Handle Data
        countries = list
        self.updateState?(.success(.init(
            title: "",
            description: "",
            countries: didCreateCellViewModels(from: countries)
        )))
        
    }
    
    func showFullList() {
        if countries.count > 0 {
            self.updateState?(.success(.init(
                title: "",
                description: "",
                countries: didCreateCellViewModels(from: countries)
            )))
        }
    }
    
    func showFilteredList(by searchText: String) {
        if countries.count > 0 {
            let filteredCountries = filterCountries(by: searchText)
            self.updateState?(.success(.init(
                title: "",
                description: "",
                countries: didCreateCellViewModels(from: filteredCountries)
            )))
        }
    }
    
    func filterCountries(by searchText: String) -> [Country] {
        guard !searchText.isEmpty else {
            return countries
        }
        return countries.filter {
            $0.name?.lowercased().contains(searchText.lowercased()) ?? false ||
            $0.capital?.lowercased().contains(searchText.lowercased()) ?? false
        }
    }
    
    func didCreateCellViewModels(from countries: [Country]) -> [CountryListCellVM] {
        var result:[CountryListCellVM] = []
        for country in countries {
            result.append(createCellViewModel(from: country))
        }
        return result
    }
    
    func createCellViewModel(from country: Country) -> CountryListCellVM {
        var title = ""
        if let name = country.name {
            title += name
        }
        if let region = country.region {
            title += ", \(region)"
        }
        return CountryListCellVM(
            title: title,
            code: country.code ?? "",
            capital: country.capital ?? ""
        )
    }
    
}
