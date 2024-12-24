//
//  CurrencyIcon.swift
//  LOTR-Converter-SwiftUI
//
//  Created by Mahan Kheirollahi on 12/24/24.
//

import SwiftUI

struct CurrencyIcon: View {
    let currencyImage: ImageResource
    let currencyName: String
    var body: some View {
        ZStack(alignment:.bottom){
            
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100,height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}


#Preview {
    CurrencyIcon(currencyImage: .copperpenny, currencyName: "Copper Penny")
}