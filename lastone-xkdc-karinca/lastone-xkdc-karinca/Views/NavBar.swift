//
//  TabView.swift
//  lastone-xkdc-karinca
//
//  Created by Karinca Danielsen on 30/09/2022.
//

import SwiftUI

struct NavBar: View {
    var body: some View {
        TabView{
        HomeView()
            .tabItem{
                Label("Browse", systemImage: SFSymbols.browse)
        }
        FavoritesView()
            .tabItem{
                Label("Favorites", systemImage: SFSymbols.heart)
                }
            SearchView()
                .tabItem{
                    Label("Seach", systemImage: SFSymbols.search)
                }
    }
        .ignoresSafeArea()
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
        }
    }
}
