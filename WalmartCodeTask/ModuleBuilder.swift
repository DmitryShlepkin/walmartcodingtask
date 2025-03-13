//
//  ModuleBuilder.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

protocol ModuleBuilding {
    func createCountryList() -> CountryListVC
}

final class ModuleBuilder: ModuleBuilding {
    
    let networkManager = NetworkManager()
    
    func createCountryList() -> CountryListVC {
        let vm = CountryListVM(networkManager: networkManager)
        let vc = CountryListVC(viewModel: vm)
        return vc
    }
    
}
