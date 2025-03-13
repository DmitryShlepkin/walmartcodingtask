//
//  CountryListView+Cell.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

import UIKit

final class CountryListCellView: UITableViewCell {
    
    private var backgroudImageURL: String? = nil
    
    private let containerView = UIView()
    private let nameLabel = UILabel()
    private let titleLabel = UILabel()
    private let capitalLabel = UILabel()
    private let codeLabel = UILabel()
    
    func configure(
        title: String,
        code: String,
        capital: String
    ) {
        titleLabel.text = title
        codeLabel.text = code
        capitalLabel.text = capital
        setup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroudImageURL = nil
        titleLabel.text = ""
    }
    
}

// MARK: - Setup
private extension CountryListCellView {
    
    func setup() {
        backgroundColor = .white
        setupContainerView()
        setupCodeLabel()
        setupTitleLabel()
        setupCapitalLabel()
    }
    
    func setupContainerView() {
        contentView.addSubview(containerView)
        containerView
            .pin(to: contentView, withInsets: .init(top: 8, left: 16, bottom: 8, right: 16))
    }
    
    func setupCodeLabel() {
        containerView.addSubview(codeLabel)
        codeLabel.numberOfLines = 1
        codeLabel.textColor = .black
        codeLabel.textAlignment = .right
        codeLabel.font = UIFont.preferredFont(forTextStyle: .body)
        codeLabel.adjustsFontForContentSizeCategory = true
        codeLabel
            .width(48)
            .trailing(to: containerView.trailingAnchor, spacing: -8)
            .top(to: containerView.topAnchor, spacing: 0)
            .bottom(to: containerView.bottomAnchor, spacing: 0)
    }
    
    func setupTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel
            .leading(to: containerView.leadingAnchor, spacing: 8)
            .trailing(to: codeLabel.leadingAnchor, spacing: 16)
            .top(to: containerView.topAnchor, spacing: 0)
    }
    
    func setupCapitalLabel() {
        containerView.addSubview(capitalLabel)
        capitalLabel.numberOfLines = 0
        capitalLabel.textColor = .darkGray
        capitalLabel.font = UIFont.preferredFont(forTextStyle: .body)
        capitalLabel.adjustsFontForContentSizeCategory = true
        capitalLabel
            .leading(to: containerView.leadingAnchor, spacing: 8)
            .trailing(to: codeLabel.leadingAnchor, spacing: 16)
            .top(to: titleLabel.bottomAnchor, spacing: 8)
            .bottom(to: containerView.bottomAnchor, spacing: 0)
    }
    
}
