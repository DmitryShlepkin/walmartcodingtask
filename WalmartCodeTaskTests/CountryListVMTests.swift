//
//  CountryListVMTests.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

import XCTest
@testable import WalmartCodeTask

class NetworkManagerMock: NetworkManaging {
    func fetch<T>(url urlString: String, as type: T.Type) async throws -> (T?, (any Error)?) where T : Decodable, T : Encodable {
        return (nil, nil)
    }
}

class CountryListVMTests: XCTestCase {
    
    func testCreateCellViewModelFromCountry_givenCountryModel_expectCountryListCellVM() {
        let sut = CountryListVM(networkManager: NetworkManagerMock())
        let mock = Country(capital: "4", code: "3", currency: nil, flag: nil, language: nil, name: "1", region: "2")
        let result = sut.createCellViewModel(from: mock)
        XCTAssertTrue(result.title == "1, 2")
        XCTAssertTrue(result.code == "3")
        XCTAssertTrue(result.capital == "4")
    }
    
    func testCreateCellViewModelFromCountries_givenCountryModels_expectArrayOfCountryListCellVM() {
        let sut = CountryListVM(networkManager: NetworkManagerMock())
        let mock = [
        Country(capital: "4", code: "3", currency: nil, flag: nil, language: nil, name: "1", region: "2"),
        Country(capital: "4", code: "3", currency: nil, flag: nil, language: nil, name: "1", region: "2")
        ]
        let result = sut.didCreateCellViewModels(from: mock)
        XCTAssertTrue(result.count == 2)
    }
    
    
    func testfilterCountriesBySearchText_givenSearchTextContainsName_expectFilteredListOfCountries() {
        let sut = CountryListVM(networkManager: NetworkManagerMock())
        let mock = [
        Country(capital: "4", code: "3", currency: nil, flag: nil, language: nil, name: "A", region: "B"),
        Country(capital: "4", code: "3", currency: nil, flag: nil, language: nil, name: "C", region: "D")
        ]
        sut.countries = mock
        let result = sut.filterCountries(by: "A")
        XCTAssertTrue(result.count == 1)
    }
    
    func testFilterCountriesBySearchText_givenSearchTextContainsCapital_expectFilteredListOfCountries() {
        let sut = CountryListVM(networkManager: NetworkManagerMock())
        let mock = [
        Country(capital: "B", code: "3", currency: nil, flag: nil, language: nil, name: "A", region: nil),
        Country(capital: "D", code: "3", currency: nil, flag: nil, language: nil, name: "C", region: nil)
        ]
        sut.countries = mock
        let result = sut.filterCountries(by: "B")
        XCTAssertTrue(result.count == 1)
    }
    
}
