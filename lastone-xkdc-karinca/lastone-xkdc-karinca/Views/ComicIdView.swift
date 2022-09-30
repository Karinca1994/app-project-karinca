//
//  ComicIdView.swift
//  lastone-xkdc-karinca
//
//  Created by Karinca Danielsen on 30/09/2022.
//

import SwiftUI

struct ComicIdView: View {
        var comic: ComicsEntry
        @State private var isShowingSafari = false
        
        var body: some View {
            ScrollView {
                VStack {
                    VStack {
                        Text(comic.title)
                            .font(.custom(CustomFont.xkcd, size: 20))
                        
                        ImageView(url: comic.imgs[0].sourceURL)
                        
                        HStack {
                            Spacer()
                            Button {
                                isShowingSafari.toggle()
                            } label: {
                                HStack {
                                    Text("Explanation")
                                        .font(.custom(CustomFont.xkcd, size: 17))
                                    Image(systemName: SFSymbols.arrow)
                                        .font(Font.body.weight(.semibold))
                                    //couldt figure out on time how to add favorites to the own site, so i just added the icon
                                    Text("Favorite \(Image(systemName: SFSymbols.heart))")
                                }
                            }.fullScreenCover(isPresented: $isShowingSafari) {
                                SafariView(url: comic.explainURL)
                                    .ignoresSafeArea()
                            }
                        }
                        .padding()
                        
                        HStack {
                            Text("#\(comic.id): ")
                                .foregroundColor(.blue)
                            Text(comic.alt)
                                .font(.custom(CustomFont.xkcd, size: 17))
                        }
                        .padding()
                        
                        Text(comic.publishedAt.changeFormat())
                            .font(.subheadline)
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding()
                    
                    Spacer()
                }
            }
            .navigationTitle("#\(comic.id): ")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

struct ComicIdView_Previews: PreviewProvider {
    static var previews: some View {
        ComicIdView(comic: Examples.sampleComic)
    }
}

