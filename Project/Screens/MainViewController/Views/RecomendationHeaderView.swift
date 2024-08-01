//
//  RecomendationHeaderView.swift
//  Project
//
//  Created by Азат on 30.07.2024.
//

import UIKit

final class RecomendationHeaderView: UICollectionReusableView {
    
    static let reuseIdentifier = "SectionHeaderView"
    
    // MARK: - Private properties
    
    private let label = UILabel()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.ButtonTitles.recomdationTitle
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.textColor = .white
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}

