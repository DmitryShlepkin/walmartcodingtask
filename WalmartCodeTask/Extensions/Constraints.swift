//
//  Constraints.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

import UIKit

protocol ViewConstraintsProtocol {}

extension ViewConstraintsProtocol where Self: UIView {
    
    @discardableResult func width(_ width: CGFloat) -> Self {
        constraints.filter { $0.firstAttribute == NSLayoutConstraint.Attribute.width && $0.isActive == true }.forEach { $0.isActive = false }
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    @discardableResult func widthEqualTo(
        _ view: UIView,
        multiplier: CGFloat = 1
    ) -> Self {
        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier).isActive = true
        return self
    }
    
    @discardableResult func widthToMax(
        percents: CGFloat = 100,
        spacing: CGFloat = 0
    ) -> Self {
        DispatchQueue.main.async {
            if let superWidth = self.superview?.widthAnchor {
                self.widthAnchor.constraint(equalTo: superWidth, multiplier: percents/100, constant: spacing).isActive = true
            }
        }
        return self
    }
    
    @discardableResult func height(_ height: CGFloat) -> Self {
        constraints.filter { $0.firstAttribute == NSLayoutConstraint.Attribute.height && $0.isActive == true }.forEach { $0.isActive = false }
        
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult func heightEqualTo(
        _ view: UIView,
        multiplier: CGFloat = 1
    ) -> Self {
        heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier).isActive = true
        return self
    }
    
    @discardableResult func heightToMax(
        percents: CGFloat = 100,
        spacing: CGFloat = 0
    ) -> Self {
        DispatchQueue.main.async {
            if let superHeight = self.superview?.heightAnchor {
                self.heightAnchor.constraint(equalTo: superHeight, multiplier: percents/100, constant: spacing).isActive = true
            }
        }
        return self
    }
    
    @discardableResult func centerX(
        to view: UIView,
        spacing: CGFloat = 0
    ) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: spacing).isActive = true
        return self
    }
    
    @discardableResult func centerY(
        to view: UIView,
        spacing: CGFloat = 0
    ) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: spacing).isActive = true
        return self
    }
    
    @discardableResult func top(
        to anchor: NSLayoutYAxisAnchor,
        spacing: CGFloat = 0
    ) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: anchor, constant: spacing).isActive = true
        return self
    }
    
    @discardableResult func bottom(
        to anchor: NSLayoutYAxisAnchor,
        spacing: CGFloat = 0
    ) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: anchor, constant: spacing).isActive = true
        return self
    }
    
    @discardableResult func leading(
        to anchor: NSLayoutXAxisAnchor,
        spacing: CGFloat = 0
    ) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: anchor, constant: spacing).isActive = true
        return self
    }
    
    @discardableResult func trailing(
        to anchor: NSLayoutXAxisAnchor,
        spacing: CGFloat = 0
    ) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: anchor, constant: spacing).isActive = true
        return self
    }
        
    @discardableResult func pin(
        to view: UIView,
        withInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    ) -> Self {
        _ = top(to: view.topAnchor, spacing: withInsets.top)
            .bottom(to: view.bottomAnchor, spacing: -withInsets.bottom)
            .leading(to: view.leadingAnchor, spacing: withInsets.left)
            .trailing(to: view.trailingAnchor, spacing: -withInsets.right)
        return self
    }
    
    @discardableResult func pinWithSafeArea(
        to view: UIView,
        withInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    ) -> Self {
        _ = top(to: view.safeAreaLayoutGuide.topAnchor, spacing: withInsets.top)
            .bottom(to: view.safeAreaLayoutGuide.bottomAnchor, spacing: -withInsets.bottom)
            .leading(to: view.leadingAnchor, spacing: withInsets.left)
            .trailing(to: view.trailingAnchor, spacing: -withInsets.right)
        return self
    }
    
    @discardableResult func pinWithoutBottom(
        to view: UIView,
        withInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    ) -> Self {
        _ = top(to: view.topAnchor, spacing: withInsets.top)
            .leading(to: view.leadingAnchor, spacing: withInsets.left)
            .trailing(to: view.trailingAnchor, spacing: -withInsets.right)
        return self
    }
    
    @discardableResult func pinWithSafeAreaWithoutBottom(
        to view: UIView,
        withInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    ) -> Self {
        _ = top(to: view.safeAreaLayoutGuide.topAnchor, spacing: withInsets.top)
            .leading(to: view.leadingAnchor, spacing: withInsets.left)
            .trailing(to: view.trailingAnchor, spacing: -withInsets.right)
        return self
    }
    
    @discardableResult func pinWithoutTop(
        to view: UIView,
        withInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    ) -> Self {
        _ = bottom(to: view.safeAreaLayoutGuide.bottomAnchor, spacing: -withInsets.bottom)
            .leading(to: view.leadingAnchor, spacing: withInsets.left)
            .trailing(to: view.trailingAnchor, spacing: -withInsets.right)
        return self
    }
    
    @discardableResult func pinWithSafeAreaWithoutTop(
        to view: UIView,
        withInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    ) -> Self {
        _ = bottom(to: view.safeAreaLayoutGuide.bottomAnchor, spacing: -withInsets.bottom)
            .leading(to: view.leadingAnchor, spacing: withInsets.left)
            .trailing(to: view.trailingAnchor, spacing: -withInsets.right)
        return self
    }
    
    @discardableResult func pinWithoutLeading(
        to view: UIView,
        withInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    ) -> Self {
        _ = top(to: view.safeAreaLayoutGuide.topAnchor, spacing: withInsets.top)
            .bottom(to: view.safeAreaLayoutGuide.bottomAnchor, spacing: -withInsets.bottom)
            .trailing(to: view.trailingAnchor, spacing: -withInsets.right)
        return self
    }
    
    @discardableResult func pinWithoutTrailing(
        to view: UIView,
        withInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    ) -> Self {
        _ = top(to: view.safeAreaLayoutGuide.topAnchor, spacing: withInsets.top)
            .bottom(to: view.safeAreaLayoutGuide.bottomAnchor, spacing: -withInsets.bottom)
            .leading(to: view.leadingAnchor, spacing: withInsets.left)
        return self
    }
    
}

