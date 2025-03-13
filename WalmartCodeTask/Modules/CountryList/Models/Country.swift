//
//  Country.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

typealias CountryList = [Country]

struct Country: Codable {
    let capital: String?
    let code: String?
    let currency: Currency?
    let flag: String?
    let language: Language?
    let name: String?
    let region: String?
}
