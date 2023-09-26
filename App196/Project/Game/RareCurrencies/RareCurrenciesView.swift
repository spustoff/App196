//
//  RareCurrenciesView.swift
//  App196
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct RareCurrenciesView: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel = RareCurrenciesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Rare Currencies")
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
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack(spacing: 40) {
                        
                        ForEach(1...3, id: \.self) { index in
                            
                            VStack(alignment: .leading, spacing: 10, content: {
                                
                                HStack(content: {
                                    
                                    Text("Level: \(index) Currencies")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Image(systemName: "lock.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .regular))
                                })
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    
                                    HStack {
                                        
                                        ForEach(viewModel.signals.prefix(4), id: \.self) { index in
                                            
                                            NavigationLink(destination: {
                                                
                                                TradingSimulatorView(pair: index.resultInstrument)
                                                    .navigationBarBackButtonHidden()
                                                
                                            }, label: {
                                                
                                                VStack(spacing: 20) {
                                                    
                                                    HStack {
                                                        
                                                        Text(index.resultInstrument)
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 16, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Text("\(index.resultTp)")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 14, weight: .regular))
                                                    }
                                                    
                                                    HStack(spacing: 12) {
                                                        
                                                        HStack {
                                                            
                                                            Text("S/I")
                                                                .foregroundColor(.gray)
                                                                .font(.system(size: 13, weight: .regular))
                                                            
                                                            Text("\(index.resultSl)")
                                                                .foregroundColor(.red)
                                                                .font(.system(size: 14, weight: .regular))
                                                        }
                                                        
                                                        HStack {
                                                            
                                                            Text("T/P")
                                                                .foregroundColor(.gray)
                                                                .font(.system(size: 13, weight: .regular))
                                                            
                                                            Text("\(index.resultTp)")
                                                                .foregroundColor(.green)
                                                                .font(.system(size: 14, weight: .regular))
                                                        }
                                                    }
                                                }
                                                .padding()
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                                            })
                                        }
                                    }
                                }
                                .opacity(index > 1 ? 0.4 : 1)
                                .disabled(index > 1 ? true : false)
                            })
                        }
                    }
                    .padding()
                }
            }
            .onAppear {
                
                viewModel.getPodcasts()
            }
        }
    }
}

#Preview {
    RareCurrenciesView()
}
