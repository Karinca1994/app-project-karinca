//
//  NumberView.swift
//  lastone-xkdc-karinca
//
//  Created by Karinca Danielsen on 30/09/2022.
//

import SwiftUI

struct NumberView: View {
    var number: Int
    
    var body: some View {
        ZStack {
            foregroundColor(.red)
                .padding()
            Text("#\(number)")
                .bold()
                .foregroundColor(.gray)
        }
        .frame(width: 50, height: 25)
        .font(.system(size: 19))        
    }
}

struct Number_Previews: PreviewProvider {
    static var previews: some View {
        NumberView(number: Examples.number)
    }
}
