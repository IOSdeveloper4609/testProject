//
//  MainView.swift
//  Project
//
//  Created by Азат on 30.07.2024.
//

import UIKit

final class MainView: UIView {
    
    // MARK: - Public properties
    
    let sideMenu = SideMenuView()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let searchController = UISearchController()
    
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

    // MARK: - Private methods
    private func setupViews() {
        backgroundColor = .black

        searchController.searchBar.returnKeyType = .search
        searchController.obscuresBackgroundDuringPresentation = false
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        sideMenu.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        addSubview(sideMenu)
        
        collectionView.register(RecomendationCell.self, forCellWithReuseIdentifier: RecomendationCell.reuseIdentifier)
        collectionView.register(CategorieCell.self, forCellWithReuseIdentifier: CategorieCell.reuseIdentifier)
        collectionView.register(PromotionCell.self, forCellWithReuseIdentifier: PromotionCell.reuseIdentifier)
        
        collectionView.register(RecomendationHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecomendationHeaderView.reuseIdentifier)
        
        collectionView.register(PromotionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PromotionHeaderView.reuseIdentifier)
        
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = false
        collectionView.contentInset = UIEdgeInsets(
            top: 12,
            left: 0,
            bottom: 12,
            right: 0
        )
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            sideMenu.topAnchor.constraint(equalTo: topAnchor),
            sideMenu.bottomAnchor.constraint(equalTo: bottomAnchor),
            sideMenu.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}

