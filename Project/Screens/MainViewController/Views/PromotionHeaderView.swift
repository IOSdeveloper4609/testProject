//
//  PromotionHeaderView.swift
//  Project
//
//  Created by Азат on 30.07.2024.
//

import UIKit

final class PromotionHeaderView: UICollectionReusableView {
    
    static let reuseIdentifier = "PromotionHeaderView"
    
    // MARK: - Private properties
    
    private let conteinerView = UIView()
    private let customSegmentControl = CustomSegmentControl()
    private let customDiliveryAddresView = CustomDiliveryAddresView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        conteinerView.translatesAutoresizingMaskIntoConstraints = false
        customSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        customDiliveryAddresView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(conteinerView)
        conteinerView.addSubview(customSegmentControl)
        conteinerView.addSubview(customDiliveryAddresView)
        
        conteinerView.backgroundColor = UIColor(red: min((34 + 20)/255, 1.0), green: min((34 + 20)/255, 1.0), blue: min((34 + 20)/255, 1.0), alpha: 1.0)
        conteinerView.layer.cornerRadius = 20
        
        
        customDiliveryAddresView.layer.cornerRadius = 20
        customDiliveryAddresView.layer.masksToBounds = true
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            conteinerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            conteinerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            conteinerView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            conteinerView.heightAnchor.constraint(equalToConstant: 110),
            
            customSegmentControl.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 8),
            customSegmentControl.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 8),
            customSegmentControl.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -8),
            customSegmentControl.heightAnchor.constraint(equalToConstant: 42),
            
            customDiliveryAddresView.topAnchor.constraint(equalTo: customSegmentControl.bottomAnchor, constant: 10),
            customDiliveryAddresView.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 8),
            customDiliveryAddresView.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -8),
            customDiliveryAddresView.bottomAnchor.constraint(equalTo: conteinerView.bottomAnchor, constant: -8)
        ])
    }
    
}

