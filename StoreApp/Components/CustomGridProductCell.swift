//
//  CustomGridCell.swift
//  StoreApp
//
//  Created by Macbook Air 13 on 18.12.23.
//

import SwiftUI

struct CustomGridProductCell: View {
    
    // MARK: - Properties
    let product: Product
    
    
    // MARK: - body
    var body: some View {
        
        VStack {
            
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image.image?
                    .resizable()
                    .frame(height: 100)
                    .scaledToFit()
            }
            .frame(height: 100)
            
            HStack {
                Text(product.title)
                Spacer()
            }
            
            HStack {
                Text("By \(product.brand)")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                Spacer()
            }
            
            HStack {
                
                Text("$\(product.price)")
                    .font(.title3)
                    .bold()
                
                Button {
                    print("Add")
                } label: {
                    Text("ADD")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.backgroundWhite)
                        .padding(.all, 6)
                        .background(Color.customDarkBlueTint)
                        .cornerRadius(8)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.all)
        .background(Color.backgroundWhite)
        .cornerRadius(16)
        .shadow(radius: 10)
    }
}


// MARK: - Preview
//struct CustomGridCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomGridCell()
//    }
//}
