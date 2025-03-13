//
//  Reusable.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

import UIKit

protocol Reusable {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String {
        String(describing: Self.self)
    }
}

extension UITableViewCell: Reusable {}
extension UICollectionViewCell: Reusable {}
