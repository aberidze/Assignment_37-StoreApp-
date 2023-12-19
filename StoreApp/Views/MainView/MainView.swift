//
//  MainView.swift
//  StoreApp
//
//  Created by Macbook Air 13 on 18.12.23.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @ObservedObject var mainViewModel: MainViewModel
    
    
    // MARK: - body
    var body: some View {
        
        NavigationStack {
            
            ZStack(alignment: .bottom) {
                
                verticalScrollView
                checkoutButtonView
            }
        }
    }
    
    
    // MARK: - Private Views
    private var verticalScrollView: some View {
        
        ScrollView {
            
            currentBalanceDisplayView
            productsGridView
        }
        .navigationTitle("Store App")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "line.3.horizontal")
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "person.circle.fill")
            }
        }
        .navigationDestination(for: Product.self) { product in
            ProductsDetailView(product: product)
        }
        .background(Color.customLightGrayTint)
    }
    
    private var currentBalanceDisplayView: some View {
        
        VStack(spacing: 10) {
            
            HStack {
                Text("Current Balance:")
                Spacer()
            }
            
            Text("$\(mainViewModel.balance)")
                .font(.largeTitle)
                .bold()
        }
        .foregroundColor(Color.customDarkBlueTint)
        .frame(maxWidth: .infinity)
        .padding(.all)
        .background(Color.customGoldenTint)
        .cornerRadius(16)
        .padding(.vertical, 10)
        .padding(.horizontal)
    }
    
    private var productsGridView: some View {
        
        LazyVGrid(columns: mainViewModel.customColumns, spacing: 20) {
            
            Section {
                
                ForEach(mainViewModel.allProducts, id: \.self) { product in
                    
                    NavigationLink(value: product) {
                        CustomGridProductCell(product: product)
                    }
                    .buttonStyle(.plain)
                }
            } header: {
                
                Text("Products")
                    .font(.title)
                    .bold()
            }
        }
        .padding(.bottom, 100)
    }
    
    private var checkoutButtonView: some View {
        
        Button {
            print("asd")
        } label: {
            Text("Total: ")
                .foregroundColor(Color.backgroundWhite)
                .bold()
                .frame(maxWidth: .infinity, maxHeight: 70)
                .background(Color.customDarkBlueTint)
                .cornerRadius(16)
        }
        .padding(.horizontal, 5)
    }
}


// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(mainViewModel: MainViewModel())
    }
}
