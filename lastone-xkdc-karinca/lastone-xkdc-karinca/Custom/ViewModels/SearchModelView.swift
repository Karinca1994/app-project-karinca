//
//  SearchModelView.swift
//  lastone-xkdc-karinca
//
//  Created by Karinca Danielsen on 30/09/2022.
//

import Foundation
import SwiftUI

class SearchModelView: ObservableObject {
    @Published var comics = ComicsModel()
    @Published var searchText = ""
    
    init() { getComics() }

    func searchInComics(in searchText: String) -> ComicsModel {
        return self.comics.filter { $0.title.lowercased().contains(searchText.lowercased()) || $0.alt.lowercased().contains(searchText.lowercased()) || String($0.id).lowercased().contains(searchText.lowercased()) || searchText.isEmpty
        }
    }
    
    private func getComics() {
        NetworkApi.shared.getComics(since: 0) { result in
            switch result {
            case .success(let comics):
                DispatchQueue.main.async {
                    self.comics = comics.reversed()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
