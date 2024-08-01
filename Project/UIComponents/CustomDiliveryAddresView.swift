//
//  CustomDiliveryAddresView.swift
//  Project
//
//  Created by Азат on 01.08.2024.
//

import UIKit

final class CustomDiliveryAddresView: UIView {
    
    // MARK: - Private properties
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        setupGestureRecognizer()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupConstraints()
        setupGestureRecognizer()
    }

    // MARK: - Private methods
    
    @objc
    private func handleTap() {
        print("CustomView tapped")
    }
    
    private func setupViews() {
        backgroundColor = Constants.Colors.mainBackground
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .white
       
        titleLabel.text = Constants.ButtonTitles.adressDilivery
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = .white
        titleLabel.alpha = 0.8
        
        addSubview(imageView)
        addSubview(titleLabel)
    }
    
    private func setupGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),

            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
