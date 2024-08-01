//
//  RecomendationCell.swift
//  Project
//
//  Created by Азат on 30.07.2024.
//

import UIKit

final class RecomendationCell: BaseCell {
    
    // MARK: - Public properties
    
    var addButtonTappedClosure: (() -> Void)?
    
    // MARK: - Private properties
    
    private let imageView = UIImageView()
    private let addFavourite = UIButton()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    private let oldPriceLabel = UILabel()
    private let weightLabel = UILabel()
    private let addButton = UIButton(type: .system)
    
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
    
    func configure(with vm: RecomendationProduct) {
        imageView.image = UIImage(named: vm.imageView)
        titleLabel.text = vm.title
        descriptionLabel.text = vm.description
        priceLabel.text = "\(vm.price)"
        
        let attributes: [NSAttributedString.Key: Any] = [
            .strikethroughStyle: NSUnderlineStyle.single.rawValue,
            .strikethroughColor: UIColor.white
        ]
        let oldPriceText = "\(vm.oldPrice)"
        let attributedOldPrice = NSAttributedString(string: oldPriceText, attributes: attributes)
        oldPriceLabel.attributedText = attributedOldPrice
        
        weightLabel.text = "\(vm.weight)"
    }
    
    // MARK: - Private methods
    
    private func setupViews() {
        titleLabel.adjustsFontSizeToFitWidth = true
        
        layer.cornerRadius = 15
        layer.masksToBounds = true
        backgroundColor = Constants.Colors.mainBackground
        
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 7
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        priceLabel.textColor = .red
        priceLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        priceLabel.adjustsFontSizeToFitWidth = true
        
        oldPriceLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        oldPriceLabel.textColor = .white
        oldPriceLabel.adjustsFontSizeToFitWidth = true
        
        weightLabel.textColor = .white
        weightLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 20),
            .foregroundColor: UIColor.white
        ]
        
        let attributedTitle = NSAttributedString(string: "+", attributes: attributes)
        addButton.setAttributedTitle(attributedTitle, for: .normal)
        addButton.backgroundColor = .red
        addButton.layer.cornerRadius = 15
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        addFavourite.setImage(UIImage(named: "heart"), for: .normal)
        addFavourite.layer.cornerRadius = 15
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(weightLabel)
        contentView.addSubview(oldPriceLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(addButton)
        imageView.addSubview(addFavourite)
    }
    
    @objc
    private func addButtonTapped() {
        addButtonTappedClosure?()
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addFavourite.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        oldPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            addFavourite.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 5),
            addFavourite.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            addFavourite.heightAnchor.constraint(equalToConstant: 30),
            addFavourite.widthAnchor.constraint(equalToConstant: 30),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 6),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -6),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            weightLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            weightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            weightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            priceLabel.widthAnchor.constraint(equalToConstant: 50),
            
            oldPriceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            oldPriceLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 12),
            oldPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            addButton.widthAnchor.constraint(equalToConstant: 30),
            addButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}

