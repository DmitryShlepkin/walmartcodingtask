//
//  CountryListView+Table.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

import UIKit

extension CountryListView: UITableViewDelegate {

}

extension CountryListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CountryListCellView.identifier) as? CountryListCellView else {
            return UITableViewCell()
        }
        let data = cellsData[indexPath.row]
        cell.configure(
            title: data.title,
            code: data.code,
            capital: data.capital
        )
        cell.selectionStyle = .none
//        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
}
