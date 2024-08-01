//
//  SideMenuView.swift
//  Project
//
//  Created by Азат on 31.07.2024.
//

import UIKit

final class SideMenuView: UIView {
    
    // MARK: - Public properties
    
    var isMenuOpen = false
    
    // MARK: - Private properties
    
    private let menuWidth: CGFloat = 200
    private var leadingConstraint: NSLayoutConstraint?
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupConstraints()
    }
    
    // MARK: - Public methods
    
    func toggleMenu(shouldOpen: Bool) {
        isMenuOpen = shouldOpen
        
        // Проверка, что leadingConstraint не nil
        guard let leadingConstraint = leadingConstraint else { return }
        
        leadingConstraint.constant = shouldOpen ? 0 : -menuWidth

        UIView.animate(withDuration: 0.3) {
            self.superview?.layoutIfNeeded()
        }
    }
    
    // MARK: - Private methods
    
    private func setupViews() {
        backgroundColor = .systemGray
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupConstraints() {
        guard let superview = superview else { return }

        leadingConstraint = leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: -menuWidth)
        
        if let leadingConstraint = leadingConstraint {
            NSLayoutConstraint.activate([
                leadingConstraint,
                topAnchor.constraint(equalTo: superview.topAnchor),
                bottomAnchor.constraint(equalTo: superview.bottomAnchor),
                widthAnchor.constraint(equalToConstant: menuWidth)
            ])
        }
    }
}
