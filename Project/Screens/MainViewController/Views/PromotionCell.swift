//
//  PromotionCell.swift
//  Project
//
//  Created by Азат on 30.07.2024.
//

import UIKit

final class PromotionCell: BaseCell {
    
  // MARK: - Private properties

    private let imageView = UIImageView()
    private var titleLabel = UILabel()
    
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

  func configure(with vm: Promotion) {
      imageView.image = UIImage(named: vm.image)
      titleLabel.text = vm.title
  }
    
    // MARK: - Private methods
    
    private func setupViews() {
        titleLabel.adjustsFontSizeToFitWidth = true
        
        backgroundColor = Constants.Colors.mainBackground
        layer.cornerRadius = 13
        layer.masksToBounds = true
        
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
    }

    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}

