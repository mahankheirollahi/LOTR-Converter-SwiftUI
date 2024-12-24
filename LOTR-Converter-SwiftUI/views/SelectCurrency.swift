//
//  SelectCurrencyView.swift
//  LOTR-Converter-SwiftUI
//
//  Created by Mahan Kheirollahi on 12/24/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    var body: some View {
        ZStack{
            
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                

                IconGrid(currency: $topCurrency)
                
                
                Text("Select the currency you would like to\n convert to:")
                    .fontWeight(.bold)
                    .padding(.top)
                
                
                IconGrid(currency: $bottomCurrency)
                
                
                Button("Done"){
                    dismiss()
                }.buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding()
                    .foregroundStyle(.white)
                    
                
            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .silverPenny
    @Previewable @State var bottomCurrency: Currency = .goldPenny
    SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}




