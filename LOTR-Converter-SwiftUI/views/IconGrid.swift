//
//  IconGrid.swift
//  LOTR-Converter-SwiftUI
//
//  Created by Mahan Kheirollahi on 12/24/24.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
    var body: some View {
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]){
            ForEach(Currency.allCases){ currency in
                
                if self.currency == currency{
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            self.currency = currency
                        }
                        .shadow(color: .black, radius: 5)
                        .overlay{
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.8)
                        }
                    
                }
                else{
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            self.currency = currency
                        }
                }
            }
        }
    }
}


#Preview {
    @Previewable @State var currency: Currency = .silverPenny
    IconGrid(currency: $currency)
}
