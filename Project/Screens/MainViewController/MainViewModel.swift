//
//  MainViewModel.swift
//  Project
//
//  Created by Азат on 30.07.2024.
//

import Foundation
import UIKit

protocol MainViewModel: AnyObject {
    var allSections: [AllSection] { get }
    var promotionsArray: [Promotion] { get }
    var categoriesArray: [String] { get }
    var recomendationsArray: [RecomendationProduct] { get }
    var filteredData: [RecomendationProduct] { get set }
    
    func findSectionIndex(section: AllSection) -> Int?
    func loadData()
}

final class SearchViewModelImpl: MainViewModel {
    
    // MARK: - Public properties
    
    var promotionsArray = [Promotion] ()
    var recomendationsArray = [RecomendationProduct]()
    var filteredData = [RecomendationProduct]()
    var categoriesArray = [String] ()
    var allSections = [AllSection]()
    
    // MARK: - Private properties
    
    func findSectionIndex(section: AllSection) -> Int? {
        allSections.firstIndex(of: section)
    }
    
    // MARK: - Private methods
    
    func loadData() {
        promotionsArray = [
            Promotion(image: "image2", title: "Ролл или пицца в подарок!, забирай"),
            Promotion(image: "image2", title: "3-я пицца в подарок!, забирай скорее"),
            Promotion(image: "image2", title: "Ролл или пицца в подарок!"),
            Promotion(image: "image2", title: "3-я пицца в подарок!"),
            Promotion(image: "image2", title: "Ролл или пицца в подарок!"),
            Promotion(image: "image2", title: "3-я пицца в подарок!")
        ]
        
        categoriesArray = [
            "Мы рекомендуем",
            "Популярное",
            "Японская кухня",
            "Мы рекомендуем",
            "Популярное",
            "Японская кухня"
        ]
        
        recomendationsArray = [
            RecomendationProduct(imageView: "image1", title: "Асума", description: "Тигровая креветка, сыр, огурец, омлет, водоросли, кисло-сладкий соус, унаги соус.Тигровая креветка, сыр, огурец, омлет, соус, унаги соус.Тигровая креветка", price: "355 р.", oldPrice: "225 р.", weight: "251 г."),
            RecomendationProduct(imageView: "image1", title: "Банзай", description: "Тигровая креветка, сыр, огурец, омлет, водоросли, кисло-сладкий соус, унаги соус.", price: "355 р.", oldPrice: "225 р.", weight: "251 г."),
            RecomendationProduct(imageView: "image1", title: "Маргарита", description: "ТИгровая креветка, сыр, огурец, омлет, водоросли, кисло-сладкий соус, унаги соус.", price: "355 р.", oldPrice: "225 р.", weight: "251 г."),
            RecomendationProduct(imageView: "image1", title: "Тамагучи", description: "Тигровая креветка, сыр, огурец, омлет, водоросли, кисло-сладкий соус, унаги соус.", price: "355 р.", oldPrice: "225 р.", weight: "251 г."),
            RecomendationProduct(imageView: "image1", title: "Аляска", description: "Тигровая креветка, сыр, огурец, омлет, водоросли, кисло-сладкий соус, унаги соус.", price: "355 р.", oldPrice: "225 р.", weight: "251 г."),
            RecomendationProduct(imageView: "image1", title: "Филадельфия", description: "Тигровая креветка, сыр, огурец, омлет, водоросли, кисло-сладкий соус, унаги соус.", price: "355 р.", oldPrice: "225 р.", weight: "251 г."),
            RecomendationProduct(imageView: "image1", title: "Калифорния", description: "Тигровая креветка, сыр, огурец, омлет, водоросли, кисло-сладкий соус, унаги соус.", price: "355 р.", oldPrice: "225 р.", weight: "251 г."),
            RecomendationProduct(imageView: "image1", title: "Жареный лосось", description: "Тигровая креветка, сыр, огурец, омлет, водоросли, кисло-сладкий соус, унаги соус.", price: "355 р.", oldPrice: "225 р.", weight: "251 г."),
            RecomendationProduct(imageView: "image1", title: "Жареные креветки", description: "Тигровая креветка, сыр, огурец, омлет, водоросли, кисло-сладкий соус, унаги соус.", price: "355 р.", oldPrice: "225 р.", weight: "251 г."),
            RecomendationProduct(imageView: "image1", title: "Жареная курица", description: "Тигровая креветка, сыр, огурец, омлет, водоросли, кисло-сладкий соус, унаги соус.", price: "355 р.", oldPrice: "225 р.", weight: "251 г."),
            RecomendationProduct(imageView: "image1", title: "Жареный лосось", description: "Тигровая креветка, сыр, огурец, омлет, водоросли, кисло-сладкий соус, унаги соус.", price: "355 р.", oldPrice: "225 р.", weight: "251 г."),
            RecomendationProduct(imageView: "image1", title: "Жареные креветки", description: "Тигровая креветка, сыр, огурец, омлет, водоросли, кисло-сладкий соус, унаги соус.", price: "355 р.", oldPrice: "225 р.", weight: "251 г."),
            RecomendationProduct(imageView: "image1", title: "Жареная курица", description: "Тигровая креветка, сыр, огурец, омлет, водоросли, кисло-сладкий соус, унаги соус.", price: "355 р.", oldPrice: "225 р.", weight: "251 г.")
        ]
        
        allSections.append(.promotions)
        allSections.append(.categories)
        allSections.append(.recomendations)
    }
    
}


