//
//  CategorieCell.swift
//  Project
//
//  Created by Азат on 30.07.2024.
//

import UIKit

final class CategorieCell: BaseCell {
    
    // MARK: - Private properties
    
    private var titleLabel = UILabel()
    
    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = isSelected ? UIColor.red : UIColor(red: 34/255, green: 34/255, blue: 34/255, alpha: 1.0)
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupConstraints()
    }
    
    // MARK: - Public methods
    
    func configure(with vm: ViewModel, isSelected: Bool) {
        titleLabel.text = vm.title
    }
    
    // MARK: - Private methods
    
    private func setupViews() {
        layer.cornerRadius = 16
        layer.masksToBounds = true
        backgroundColor = Constants.Colors.mainBackground
        
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        titleLabel.textColor = .white
        contentView.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}

extension CategorieCell {
    struct ViewModel: Equatable {
        let title: String
    }
}



