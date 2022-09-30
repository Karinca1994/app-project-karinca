//
//  SafariView.swift
//  lastone-xkdc-karinca
//
//  Created by Karinca Danielsen on 30/09/2022.
//

import SwiftUI
import SafariServices
//https://developer.apple.com/documentation/safariservices/ -- saw tutorial and made a safariView for the app
struct SafariView: UIViewControllerRepresentable {
    let url: String
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: URL(string: url)!)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) { }
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(url: "https://xkcd.com/")
    }
}
