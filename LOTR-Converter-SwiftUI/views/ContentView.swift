//
//  ContentView.swift
//  LOTR-Converter-SwiftUI
//
//  Created by Mahan Kheirollahi on 12/22/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @State var showExchangeInfo: Bool = false
    @State var showSelectedCurrency: Bool = false
    @State var leftAmount: String = ""
    @State var rightAmount: String = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack{
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                
                
                // Left conversion section
                HStack{
                    VStack{
                        HStack{
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectedCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip,arrowEdge: .bottom)
                        
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                        
                    }
                    
                    // Equal Sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    
                    
                    // Right conversion section
                    VStack{
                        HStack{
                            
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
        
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectedCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                      
                        
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            
                    }
                    
                    
                }
                .padding()
                .background(.black.opacity(0.5))
                .keyboardType(.numberPad)
                .onTapGesture {
                    showSelectedCurrency.toggle()
                }
                
                
                Spacer()
                
                HStack{
                    Spacer()
                    Button{
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.trailing)
                
            }
            
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount){
            if leftTyping {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmount){
            if rightTyping {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: leftCurrency){
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)

        }
        .onChange(of: rightCurrency){
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        }
        
        .sheet(isPresented: $showExchangeInfo){
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectedCurrency){
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
        
    }
}

#Preview {
    ContentView()
}
