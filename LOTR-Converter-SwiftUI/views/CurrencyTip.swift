//
//  CurrencyTip.swift
//  LOTR-Converter-SwiftUI
//
//  Created by Mahan Kheirollahi on 12/24/24.
//

import TipKit

struct CurrencyTip: Tip{
    var title = Text("Change Currency")
    var message: Text? = Text("You can tap the left or right currency to bring up the Select Currency Screen")
    var image: Image? = Image(systemName: "hand.tap.fill")
}
