//
//  SearchView.swift
//  lastone-xkdc-karinca
//
//  Created by Karinca Danielsen on 30/09/2022.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchModelView()
    @State private var searchText: String = ""
    var comic: ComicsEntry

    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                ZStack {
                    Color(.gray)
                        .frame(height: 35)
                        .cornerRadius(10)
                    HStack {
                        Image(systemName: SFSymbols.search)
                            .padding(.leading, 5)
                        TextField("Serch by id, or name", text: $searchText)
                            .font(.custom(CustomFont.xkcd, size: 12))
                            .frame(height: 35)
                            .cornerRadius(10)
                    }
                }
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding([.trailing, .leading], 13)
                
                if viewModel.comics.isEmpty {
                    Spacer()
                    ProgressView()
                    Spacer()
                } else {
                    List {
                        ForEach(viewModel.searchInComics(in: searchText)) { item in
                            NavigationLink(destination: ComicIdView(comic: item)) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text(comic.title)
                                                .font(.custom(CustomFont.xkcd, size: 20))
                                            Spacer()
                                            NumberView(number: comic.id)
                                        Text(comic.alt)
                                            .font(.system(size: 16, weight: .semibold))
                                    }
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                    .onAppear {
                        UITableView.appearance().backgroundColor = UIColor.gray
                    }
                }
            }
            .ignoresSafeArea()
            .navigationBarTitle("Search")
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(comic: Examples.sampleComic)
    }
}
