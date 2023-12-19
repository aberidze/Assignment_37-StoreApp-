//
//  MainViewModel.swift
//  StoreApp
//
//  Created by Macbook Air 13 on 19.12.23.
//

import SwiftUI
import NetworkManagerPro

final class MainViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var balance = 1370
    @Published var error: String?
    @Published var products: [Product] = []
    @Published var allProducts: [Product] = []
    
    let customColumns = [
        GridItem(.flexible(minimum: 150, maximum: 170), spacing: 20),
        GridItem(.flexible(minimum: 150, maximum: 170), spacing: 20)
    ]
    
    
    // MARK: - Initializer
    init() {
        fetchProducts()
    }
    
    
    // MARK: - Methods
    func fetchProducts() {
        let urlString = "https://dummyjson.com/products"
        guard let url = URL(string: urlString) else { return }
        
        Network().request(with: url) { (result: Result<ProductsResponse, Error>) in
            
            switch result {
            
            case .success(let productsResponse):
                DispatchQueue.main.async {
                    self.products = productsResponse.products
                    self.allProducts = productsResponse.products
                }
            
            case .failure(let error):
                self.error = error.localizedDescription
            }
        }
    }
}
