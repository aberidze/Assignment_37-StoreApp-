//
//  MainTabView.swift
//  StoreApp
//
//  Created by Macbook Air 13 on 18.12.23.
//

import SwiftUI

struct MainTabView: View {
    
    // MARK: - body
    var body: some View {
        
        TabView {
            
            MainView(mainViewModel: MainViewModel())
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            CategoriesView()
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Categories")
                }
                .tag(1)
        }
        .tint(.customDarkBlueTint)
    }
}


// MARK: - Preview
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
