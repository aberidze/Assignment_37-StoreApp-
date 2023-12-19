//
//  ProductsDetailView.swift
//  StoreApp
//
//  Created by Macbook Air 13 on 18.12.23.
//

import SwiftUI

struct ProductsDetailView: View {
    
    // MARK: - Properties
    let product: Product
    @State private var quantity: Int = 0
    
    
    // MARK: - body
    var body: some View {
        
        VStack(alignment: .leading, spacing: 30) {
            
            productImagesCarousel
            
            VStack(alignment: .leading, spacing: 20) {
                titleDisplayView
                ratingsAndCategoryDisplayView
                Text(product.description)
                Spacer()
                priceDisplayView
                returnToCategoriesButton
            }
            .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.top)
        .background(Color.customLightGrayTint)
    }
    
    
    // MARK: - Private Views
    private var productImagesCarousel: some View {
        
        TabView {
            
            ForEach(product.images, id: \.self) { image in
                
                AsyncImage(url: URL(string: image)) { productImage in
                    
                    productImage.image?
                        .resizable()
                        .scaledToFill()
                }
            }
        }
        .frame(maxHeight: UIScreen.screenHeight / 2)
        .background(Color.backgroundWhite)
        .cornerRadius(16)
        .tabViewStyle(PageTabViewStyle())
        .shadow(radius: 15)
    }
    
    private var titleDisplayView: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                
                Text(product.title)
                    .font(.title)
                    .bold()
                
                Text(product.brand)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("\(product.discountPercentage, specifier: "%.0f")% OFF")
                .bold()
                .padding(.all, 10)
                .background(Color.customRedTint)
                .cornerRadius(10)
        }
    }
    
    private var ratingsAndCategoryDisplayView: some View {
        
        HStack(spacing: 16) {
            
            HStack(spacing: 10) {
                
                Image(systemName: "star.fill")
                    .foregroundColor(.orange)
                
                Text("\(product.rating, specifier: "%.1f")")
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .overlay {
                Capsule(style: .continuous)
                    .stroke(.gray, style: StrokeStyle(lineWidth: 2))
            }
            
            Text(product.category)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .overlay {
                    Capsule(style: .continuous)
                        .stroke(.gray, style: StrokeStyle(lineWidth: 2))
                }
        }
    }
    
    private var priceDisplayView: some View {
        
        Text("Price: $\(product.price)")
            .font(.title)
            .bold()
    }
    
    private var returnToCategoriesButton: some View {
        
        Button {
            print("asd")
        } label: {
            Text("Return to Categories")
                .foregroundColor(Color.backgroundWhite)
                .bold()
                .frame(maxWidth: .infinity, maxHeight: 70)
                .background(Color.customDarkBlueTint)
                .cornerRadius(16)
        }
    }
}


// MARK: - Preview
struct ProductsDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let testProduct = Product(id: 1, title: "Iphone X", description: "This is Iphone X", price: 300, discountPercentage: 25.0, rating: 4.69, brand: "Apple", category: "Smartphone", thumbnail: "Iphone", images: ["Iphone", "Iphone1", "Iphone2"])
        
        ProductsDetailView(product: testProduct)
    }
}
