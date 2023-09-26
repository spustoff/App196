//
//  TradingSimulatorViewModel.swift
//  App196
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

final class TradingSimulatorViewModel: ObservableObject {
    
    @Published var currencies: [String] = ["EURUSD", "EURTRY", "EURKZT", "EURJPY", "EURCAD", "USDTRY", "USDKZT", "USDJPY", "USDCAD"]
    @Published var current_currency: String = "EURUSD"
    
    
}
