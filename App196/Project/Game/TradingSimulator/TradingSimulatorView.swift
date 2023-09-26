//
//  TradingSimulatorView.swift
//  App196
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct TradingSimulatorView: View {
    
    @Environment(\.presentationMode) var router
    
    let pair: String
    
    @StateObject var viewModel = TradingSimulatorViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Trading Simulator")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .regular))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
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
                
                HStack(alignment: .top) {
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        
                        Text("\(Int.random(in: 1...205000))")
                            .foregroundColor(.white)
                            .font(.system(size: 19, weight: .medium))
                        
                        Text("+\(Int.random(in: 1...2500))%")
                            .foregroundColor(.green)
                            .font(.system(size: 14, weight: .regular))
                    })
                    
                    Spacer()
                    
                    Menu {
                        
                        ForEach(viewModel.currencies, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.current_currency = index
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(index)
                                    
                                    Spacer()
                                    
                                    if viewModel.current_currency == index {
                                        
                                        Image(systemName: "xmark")
                                    }
                                }
                            })
                        }
                        
                    } label: {
                        
                        HStack {
                            
                            Text(viewModel.current_currency)
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Image(systemName: "chevron.down")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        }
                    }
                }
                .padding(.horizontal)
                
                Chart(pair: viewModel.current_currency)
                    .disabled(true)
                
                VStack {
                    
                    HStack {
                        
                        HStack {
                            
                            Text("Coin")
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("10")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                        
                        Spacer()
                        
                        HStack {
                            
                            Text("Time")
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("00:00:00")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        
                        Text("Buy")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                        
                        Spacer()
                        
                        Text("Sell")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                    }
                    .padding(.horizontal)
                    
                }
                .overlay (
                
                    ZStack {
                        
                        Color.black.opacity(0.7)
                            
                        VStack(spacing: 7) {
                            
                            Text("Currently not available")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Text("bidding starts in 6 hours")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.system(size: 13, weight: .regular))
                        }
                    }
                )
            }
        }
        .onAppear {
            
            viewModel.current_currency = pair
        }
    }
}

#Preview {
    TradingSimulatorView(pair: "EURUSD")
}
