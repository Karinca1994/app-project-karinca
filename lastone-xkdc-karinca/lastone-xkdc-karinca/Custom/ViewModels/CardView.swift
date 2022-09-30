//
//  CardView.swift
//  lastone-xkdc-karinca
//
//  Created by Karinca Danielsen on 30/09/2022.
//

import SwiftUI


struct CardView: View {
    @State private var isShowingSafari = false
    var comic: ComicsEntry
    var body: some View {
        ZStack {
            Color(.white)
            VStack(spacing: 15) {
                
                ImageView(url: comic.imgs[0].sourceURL)
                
                HStack {
                    NumberView(number: comic.id)
                }
                
                FontView(title: comic.title, description: comic.alt)
                
                Button {
                    isShowingSafari.toggle()
                } label: {
                    HStack {
                        HStack {
                            Text("Explanation:")
                                .font(.custom(CustomFont.xkcd, size: 19))
                            Image(systemName: SFSymbols.arrow)
                                .font(Font.body.weight(.bold))
                        }
                        
                        .fullScreenCover(isPresented: $isShowingSafari) {
                            SafariView(url: comic.explainURL)
                                .ignoresSafeArea()
                        }
                    }
                    Spacer()
                    Text(comic.publishedAt.changeFormat())
                        .font(Font.body.weight(.semibold))
                }
            }
            .padding()
        }
        .padding()
    }
}


extension String {
    func changeFormat(inputFormat: String = "yyyy-MM-dd'T'HH:mm:ss.sssZ", outputFormat: String = "MMM d, yyyy") -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = inputFormat
        
        if let date = inputFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = outputFormat
            return outputFormatter.string(from: date)
        } else {
            return self
        }
    }
}

struct ComicCardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(comic: Examples.sampleComic)
    }
}
