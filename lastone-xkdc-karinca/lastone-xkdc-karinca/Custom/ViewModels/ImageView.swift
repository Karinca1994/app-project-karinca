//
//  ImageView.swift
//  lastone-xkdc-karinca
//
//  Created by Karinca Danielsen on 30/09/2022.
//

import SwiftUI

struct ImageView: View {
    
    @GestureState private var scale: CGFloat = 1.5
    var url: String
    
    var body: some View {
        AsyncImage(url).scaleEffect(scale)
            .gesture(MagnificationGesture().updating($scale, body: { newValue, scale, _ in
                scale = newValue
            }))
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: Examples.url)
    }
}
