//
//  PromotionHeaderView.swift
//  Project
//
//  Created by Азат on 30.07.2024.
//

import UIKit

final class PromotionHeaderView: UICollectionReusableView {
    
    static let reuseIdentifier = "PromotionHeaderView"
//    private let diliveryAdrresButton = UIButton(type: .system)
    
    // MARK: - Private properties
    
    private let conteinerView = UIView()
//    private let diliveryAdrresButton = UIButton()
    private let segmentControl = CustomSegmentControl()
    let customView = CustomDiliveryAddresView()
    
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
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(conteinerView)
        conteinerView.addSubview(segmentControl)
        conteinerView.addSubview(customView)
        
        conteinerView.backgroundColor = UIColor(red: min((34 + 20)/255, 1.0), green: min((34 + 20)/255, 1.0), blue: min((34 + 20)/255, 1.0), alpha: 1.0)
        conteinerView.layer.cornerRadius = 20
        
        
        customView.layer.cornerRadius = 20
        customView.layer.masksToBounds = true
       
                
//                NSLayoutConstraint.activate([
//                    customView.centerXAnchor.constraint(equalTo: centerXAnchor),
//                    customView.centerYAnchor.constraint(equalTo: centerYAnchor),
//                    customView.widthAnchor.constraint(equalToConstant: 300),
//                    customView.heightAnchor.constraint(equalToConstant: 50)
//                ])
        
//        diliveryAdrresButton.tintColor = .white
//        diliveryAdrresButton.setTitle(Constants.ButtonTitles.adressDilivery, for: .normal)
//        diliveryAdrresButton.backgroundColor = Constants.Colors.mainBackground
//        diliveryAdrresButton.layer.cornerRadius = 20
//        diliveryAdrresButton.contentHorizontalAlignment = .left
//        diliveryAdrresButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
//        diliveryAdrresButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        
//        
//        var buttonConfiguration = UIButton.Configuration.filled()
//        buttonConfiguration.image = UIImage(systemName: "star")
//        buttonConfiguration.imagePlacement = .trailing
//        buttonConfiguration.imagePadding = 100
        
//        var buttonConfiguration = UIButton.Configuration.filled()
//        buttonConfiguration.title = Constants.ButtonTitles.adressDilivery
//        buttonConfiguration.image = UIImage(systemName: "chevron.right")
//        buttonConfiguration.imagePlacement = .trailing
//        buttonConfiguration.baseBackgroundColor = Constants.Colors.mainBackground
//        buttonConfiguration.titleAlignment = .leading
//        
//        diliveryAdrresButton.configuration = buttonConfiguration
//        diliveryAdrresButton.layer.cornerRadius = 20
//        diliveryAdrresButton.layer.masksToBounds = true
//        diliveryAdrresButton.configuration?.titleAlignment = .leading
//        
//        diliveryAdrresButton.configuration = buttonConfiguration
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            conteinerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            conteinerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            conteinerView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            conteinerView.heightAnchor.constraint(equalToConstant: 110),
            
            segmentControl.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 8),
            segmentControl.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 8),
            segmentControl.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -8),
            segmentControl.heightAnchor.constraint(equalToConstant: 42),
            
            customView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 10),
            customView.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 8),
            customView.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -8),
            customView.bottomAnchor.constraint(equalTo: conteinerView.bottomAnchor, constant: -8)
        ])
    }
    
}

