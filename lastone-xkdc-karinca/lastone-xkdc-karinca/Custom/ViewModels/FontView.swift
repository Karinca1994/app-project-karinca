//
//  FontView.swift
//  lastone-xkdc-karinca
//
//  Created by Karinca Danielsen on 30/09/2022.
//

import SwiftUI

struct FontView: View {
    var title: String
    var description: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.custom(CustomFont.xkcd, size: 19))
                Text(description)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.gray)
            }
            Spacer()
        }
    }
}

struct FontView_Previews: PreviewProvider {
    static var previews: some View {
        FontView(title: Examples.string, description: Examples.string)
    }
}
