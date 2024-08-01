//
//  CustomSegmentControl.swift
//  Project
//
//  Created by Азат on 31.07.2024.
//

import UIKit

final class CustomSegmentControl: UIView {
    
    // MARK: - Private properties
    
    private var selectedButton: UIButton?

    private let diliveryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.ButtonTitles.diliveryTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let pickupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.ButtonTitles.pickupTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configureButtons()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        configureButtons()
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        layer.cornerRadius = 20
        clipsToBounds = true
        backgroundColor = Constants.Colors.mainBackground
        
        addSubview(diliveryButton)
        addSubview(pickupButton)
        
        NSLayoutConstraint.activate([
            diliveryButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            diliveryButton.topAnchor.constraint(equalTo: topAnchor),
            diliveryButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            diliveryButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            
            pickupButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            pickupButton.topAnchor.constraint(equalTo: topAnchor),
            pickupButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            pickupButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
        ])
    }
    
    private func configureButtons() {
        diliveryButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        pickupButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        buttonTapped(diliveryButton)
    }
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        selectedButton?.backgroundColor = Constants.Colors.mainBackground
        selectedButton?.setTitleColor(.white, for: .normal)
        sender.backgroundColor = .red
        sender.setTitleColor(.white, for: .normal)
        selectedButton = sender
    }
}
