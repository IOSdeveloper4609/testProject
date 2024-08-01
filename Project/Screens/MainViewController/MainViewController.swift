//
//  ViewController.swift
//  Project
//
//  Created by Азат on 30.07.2024.
//

import UIKit
import FacebookCore

final class MainViewController: UIViewController, CustomViewController, UICollectionViewDelegate {
    
    typealias CustomView = MainView
    
    // MARK: - Private properties
    
    private let viewModel: MainViewModel = SearchViewModelImpl()
    private var isSearching: Bool = false

    // MARK: - Lifecycle
    
    override func loadView() {
        let view = MainView()
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavigationBar()
        loadData()
        setupCategories()
    }

    // MARK: - Private methods
    
    private func loadData() {
        viewModel.loadData()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = Constants.NavigationTitle.mainScreenTitle
        
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonTapped))
        searchButton.tintColor = .red
        navigationItem.rightBarButtonItem = searchButton
        
        let infoButton = UIBarButtonItem(image: UIImage(named: "info"), style: .plain, target: self, action: #selector(infoButtonTap))
        infoButton.tintColor = .red
        
        navigationItem.rightBarButtonItems = [searchButton, infoButton]
        
        let sideButton = UIBarButtonItem(image: UIImage(named: "sideMenu"), style: .plain, target: self, action: #selector(sideMenuTap))
        sideButton.tintColor = .red
        navigationItem.leftBarButtonItem = sideButton
    }
    
    @objc
    private func infoButtonTap() {
        
    }
    
    @objc
    private func searchButtonTapped() {
        if navigationItem.searchController == nil {
            navigationItem.searchController = customView.searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        }
        customView.searchController.isActive = true
        customView.searchController.searchBar.isHidden = false
        customView.searchController.searchBar.becomeFirstResponder()
        
        AppEvents.shared.logEvent(AppEvents.Name(rawValue: "search_button_tapped"))
    }
    
    @objc 
    private func sideMenuTap() {
        customView.sideMenu.toggleMenu(shouldOpen: !customView.sideMenu.isMenuOpen)
    }
    
    private func setupViews() {
        customView.searchController.searchResultsUpdater = self
        customView.searchController.searchBar.delegate = self

        customView.collectionView.dataSource = self
        customView.collectionView.delegate = self
        customView.collectionView.collectionViewLayout = createLayout()
    }
    
    private func setupCategories() {
        if let sectionIndex = viewModel.findSectionIndex(section: .categories) {
            let indexPath = IndexPath(item: 0, section: sectionIndex)
            customView.collectionView.selectItem(
                at: indexPath,
                animated: false,
                scrollPosition: .centeredHorizontally
            )
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .vertical
        
        return UICollectionViewCompositionalLayout(sectionProvider: { [weak self] sectionIndex, _ in
            
            guard let self = self else { return nil }
           
            guard let typeSection = AllSection(rawValue: sectionIndex) else {
                return createRecomendationSection()
            }
            
            switch typeSection {
            case .promotions:
                return self.createPromotionSection()
            case .categories:
                return self.createCategoriesSection()
            case .recomendations:
                return self.createRecomendationSection()
            }
        }, configuration: configuration)
    }
    
    private func createPromotionSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(350),
            heightDimension: .absolute(180)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.trailing = 8
        item.contentInsets.leading = 8
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(350),
            heightDimension: .absolute(180)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.bottom = 10
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(140)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
                
    private func createCategoriesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(100),
            heightDimension: .absolute(35)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.trailing = 20
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(100), 
            heightDimension: .absolute(35)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
                
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 10
        section.contentInsets.top = 20
        section.contentInsets.bottom = 30
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        
        return section
    }
    
    private func createRecomendationSection() -> NSCollectionLayoutSection {
        
        let itemSize: NSCollectionLayoutSize
        
        if UIDevice.current.orientation.isLandscape {
            itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.33),
                heightDimension: .absolute(350)
            )
        } else {
            itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .absolute(350)
            )
        }
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(350)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item, item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
    
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(30)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
}

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.allSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let typeSection = AllSection(rawValue: section) else {
            return 0
        }
        switch typeSection {
        case .promotions:
            return viewModel.promotionsArray.count
        case .categories:
            return viewModel.categoriesArray.count
        case .recomendations:
            return isSearching ? viewModel.filteredData.count : viewModel.recomendationsArray.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let typeSection = AllSection(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        
        switch typeSection {
        case .promotions:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotionCell.reuseIdentifier, for: indexPath) as? PromotionCell,
                  let model = viewModel.promotionsArray[safe: indexPath.row] else {
                return UICollectionViewCell()
            }
            
            cell.configure(with: model)
            return cell
        case .categories:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategorieCell.reuseIdentifier, for: indexPath) as? CategorieCell,
                  let model = viewModel.categoriesArray[safe: indexPath.row] else {
                return UICollectionViewCell()
            }
        
            cell.configure(with: CategorieCell.ViewModel(title: model), isSelected: true)
            return cell
        case .recomendations:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecomendationCell.reuseIdentifier, for: indexPath) as? RecomendationCell,
                  let model = isSearching ? viewModel.filteredData[safe: indexPath.row] : viewModel.recomendationsArray[safe: indexPath.row] else {
                return UICollectionViewCell()
            }
            
            cell.addButtonTappedClosure = {
                AppEvents.shared.logEvent(AppEvents.Name("product_name"),
                                          parameters: [AppEvents.ParameterName("name"): model.title])
            }
            
            cell.configure(with: model)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            fatalError("Unexpected element kind")
        }
        
        guard let sectionType = AllSection(rawValue: indexPath.section) else {
            fatalError("Unexpected section type")
        }
        
        let reuseIdentifier: String
        
        switch sectionType {
        case .promotions:
            reuseIdentifier = PromotionHeaderView.reuseIdentifier
        case .recomendations:
            reuseIdentifier = RecomendationHeaderView.reuseIdentifier
        default:
            fatalError("Unexpected section type")
        }
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifier, for: indexPath) as? UICollectionReusableView else {
            fatalError("Unexpected supplementary view type")
        }
        
        return headerView
    }
    
}

// MARK: - UISearchResultsUpdating

extension MainViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
            isSearching = false
            viewModel.filteredData.removeAll()
            customView.collectionView.reloadData()
            return
        }
        
        AppEvents.shared.logEvent(AppEvents.Name("search_text_input"),
                                  parameters: [AppEvents.ParameterName("text"): searchText])
        
        isSearching = true
        viewModel.filteredData = viewModel.recomendationsArray.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        customView.collectionView.reloadData()
    }
    
}

// MARK: - UISearchBarDelegate

extension MainViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.searchController = nil
        customView.searchController.searchBar.isHidden = true
        isSearching = false
        viewModel.filteredData.removeAll()
        customView.collectionView.reloadData()
    }
    
}

