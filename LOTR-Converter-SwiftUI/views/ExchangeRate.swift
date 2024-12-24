//
//  ExchangeRate.swift
//  LOTR-Converter-SwiftUI
//
//  Created by Mahan Kheirollahi on 12/24/24.
//

import SwiftUI

struct ExchangeRate: View {
    let leadingImage: ImageResource
    let text: String
    let trailingImage: ImageResource
    
    var body: some View {
        HStack{
            Image(leadingImage)
                .resizable()
                .scaledToFit()
                .frame(width: 33)
            
            Text(text)
            
            Image(trailingImage)
                .resizable()
                .scaledToFit()
                .frame(width: 33)
        }
    }
    
}

#Preview {
    ExchangeRate(leadingImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", trailingImage: .goldpenny)
}
