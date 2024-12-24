//
//  ExchangeInfo.swift
//  LOTR-Converter-SwiftUI
//
//  Created by Mahan Kheirollahi on 12/24/24.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Text("Exchange Rates")
                    .font(.title)
                    .tracking(3)
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding()
                    
                
                ExchangeRate(leadingImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", trailingImage: .goldpenny)
                
                
                ExchangeRate(leadingImage: .goldpenny, text: "1 Gold Penny = 4 Silver Pieces", trailingImage: .silverpiece)
                
                
                ExchangeRate(leadingImage: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", trailingImage: .silverpenny)
                
                
                ExchangeRate(leadingImage: .silverpenny, text: "1 Silver Penny = 100 Copper Pennies", trailingImage: .copperpenny)
                
                
                Button("Done"){
                    dismiss()
                }.buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding()
                    .foregroundStyle(.white)
                
            }
            .foregroundStyle(.black)
            
        }
        .background(.brown)
    }
}



#Preview {
    ExchangeInfo()
}


