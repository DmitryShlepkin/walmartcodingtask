//
//  ErrorView.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

import UIKit

final class ErrorView: UIView {
        
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let actionButton = UIButton()
    
    private var titleLabelText = "Network Error"
    private var buttonText = "Try again"
    private var buttonAction: (() -> Void)?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    convenience init(
        title titleText: String,
        buttonText: String,
        buttonAction: (() -> Void)?
    ) {
        self.init(frame: CGRectZero)
        self.titleLabelText = titleText
        self.buttonText = buttonText
        self.buttonAction = buttonAction
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ErrorView {
    
    func setup() {
        setupImageView()
        setupTitleLabel()
        setupButton()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.image = UIImage(systemName: "xmark.icloud")
        imageView.tintColor = .lightGray
        imageView
            .width(80)
            .height(60)
            .centerX(to: self)
            .centerY(to: self, spacing: -80)
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = titleLabelText
        titleLabel.textColor = .red
        titleLabel.font = UIFont(name: "Avenir Next Regular", size: 18)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        titleLabel
            .top(to: imageView.bottomAnchor, spacing: 16)
            .leading(to: self.leadingAnchor, spacing: 32)
            .trailing(to: self.trailingAnchor, spacing: -32)
    }
    
    private func setupButton() {
        if (buttonAction == nil) {
            return
        }
        addSubview(actionButton)
        actionButton.setTitle(buttonText, for: .normal)
        actionButton.backgroundColor = .black
        actionButton.layer.cornerRadius = 8
        actionButton
            .width(140)
            .height(48)
            .top(to: titleLabel.bottomAnchor, spacing: 32)
            .centerX(to: self)
        actionButton.addTarget(self, action: #selector(actionButtonHandler), for: .touchUpInside)
    }
    
}


private extension ErrorView {
    
    @objc private func actionButtonHandler() {
        if let buttonAction = buttonAction {
            buttonAction()
        }
    }

}

extension ErrorView {
        
    func updateWith(buttonAction: (() -> Void)?) {
        self.buttonAction = buttonAction
        setupButton()
    }
    
    func updateWith(title titleText: String) {
        self.titleLabelText = titleText
        setupButton()
    }
    
    func updateWith(
        title titleText: String,
        buttonAction: (() -> Void)?
    ) {
        self.titleLabelText = titleText
        self.buttonAction = buttonAction
        setupButton()
    }
    
    func updateWith(
        title titleText: String,
        buttonText: String,
        buttonAction: (() -> Void)?
    ) {
        self.titleLabelText = titleText
        self.buttonText = buttonText
        self.buttonAction = buttonAction
        setupButton()
    }
    
}
