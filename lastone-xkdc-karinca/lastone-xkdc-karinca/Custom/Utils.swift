//
//  Constants.swift
//  lastone-xkdc-karinca
//
//  Created by Karinca Danielsen on 30/09/2022.
//
// downloaded font at https://eng.fontke.com/download/?hash=g5xaOv56fhe7qBQfWndngKb0UBazGZ54rB00SIdP8liY%2F9TsF%2BHh6z4LNuR8kgHA9KcvPMT4GRZTIJRlhhh27OHwXaDVDoFon%2BB%2BTzopURtoaXaandiPVqXWMG9kDB1f&name=xkcd.otf&package=2

import Foundation
import SwiftUI


enum CustomFont {
    static let xkcd = "xkcd"
}

enum Examples {
    static let url = "https://xkcd.com/"
    static var sampleComic = ComicsEntry(id: 0, publishedAt: "", news: "", safeTitle: "", title: "", transcript: "", alt: "", sourceURL: "", explainURL: "", interactiveURL: "", imgs: [ComicImageModel(height: 0, width: 0, ratio: 0.0, sourceURL: "", size: "")])
    static let number = 0
    static let bool = false
    static let string = "EMPTY"
}

enum SFSymbols {
    static let browse = "eye"
    static let search = "magnifyingglass"
    static let heart = "heart"
    static let favorite = "heart.fill"
    static let arrow = "arrow.right.circle"
    static let send = "paperplane.circle"
}
