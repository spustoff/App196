//
//  GameView.swift
//  App196
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Image("empty")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)
                    
                    VStack {
                        
                        HStack {
                            
                            Text("Level 1")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                            
                            Spacer()
                            
                            Text("You")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        }
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.gray.opacity(0.2))
                            .frame(height: 5)
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        NavigationLink(destination: {
                            
                            TradingSimulatorView(pair: "EURUSD")
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Image(.tradingSimulator)
                        })
                        
                        NavigationLink(destination: {
                            
                            RareCurrenciesView()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Image(.rareCurrencies)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    GameView()
}
