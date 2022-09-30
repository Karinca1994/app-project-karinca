//
//  HomeView.swift
//  lastone-xkdc-karinca
//
//  Created by Karinca Danielsen on 30/09/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var results = [ComicsEntry]()
    var body: some View {
        NavigationView {
                ScrollView {
                    LazyVStack(spacing: -20) {
                        List(results, id: \.id) { item in
                            CardView(comic: item)
                        }
                    }
                }
                .ignoresSafeArea()
                .navigationBarTitle("xkcd")
            
        }
}
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
