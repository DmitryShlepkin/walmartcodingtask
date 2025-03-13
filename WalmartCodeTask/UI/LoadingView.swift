//
//  LoadingView.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

import UIKit

final class LoadingView: UIView {
    
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let indicatorView = IndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup
private extension LoadingView {
        
    func setup() {
        setupTitleLabel()
        setupDescriptionLabel()
        setupIndicatorView()
    }
        
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = "Loading"
        titleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        titleLabel.adjustsFontForContentSizeCategory = true        
        titleLabel.textColor = .darkGray
        titleLabel
            .centerX(to: self)
            .centerY(to: self, spacing: -32)
    }
    
    
    private func setupDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.font = UIFont(name: "Avenir Next Regular", size: 14.0)
        descriptionLabel.textColor = .darkGray
        descriptionLabel
            .centerX(to: self)
            .top(to: titleLabel.bottomAnchor, spacing: 8)
    }
    
    private func setupIndicatorView() {
        addSubview(indicatorView)
        indicatorView
            .centerX(to: self)
            .top(to: descriptionLabel.bottomAnchor, spacing: 24)
    }
    
}

extension LoadingView {
    
    func playAnimation() {
        indicatorView.playAnimation()
    }
    
    func updateWith(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
}
