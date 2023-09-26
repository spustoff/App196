//
//  SignalsView.swift
//  App196
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct SignalsView: View {
    
    @StateObject var viewModel = RareCurrenciesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color(.bg)
                .ignoresSafeArea()
            
            VStack {
                
                Text("Available Signals")
                    .foregroundColor(.white)
                    .font(.system(size: 21, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                if viewModel.isLoading {
                    
                    ProgressView()
                        .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    if viewModel.signals.isEmpty {
                        
                        VStack(spacing: 7, content: {
                            
                            Image("empty")
                            
                            Text("Empty Signals")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                                .multilineTextAlignment(.center)
                            
                            Text("No any signals right now")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                                .multilineTextAlignment(.center)
                        })
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.signals.prefix(11), id: \.self) { index in
                                    
                                    NavigationLink(destination: {
                                        
                                        TradingSimulatorView(pair: index.resultInstrument)
                                            .navigationBarBackButtonHidden()
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            VStack(alignment: .leading, spacing: 8, content: {
                                                
                                                Text(index.resultInstrument)
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 15, weight: .medium))
                                                
                                                HStack {
                                                    
                                                    HStack(spacing: 6, content: {
                                                        
                                                        Text("S/I")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 14, weight: .medium))
                                                        
                                                        Text("\(index.resultSl)")
                                                            .foregroundColor(.red)
                                                            .font(.system(size: 14, weight: .medium))
                                                    })
                                                    
                                                    HStack(spacing: 6, content: {
                                                        
                                                        Text("T/P")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 14, weight: .medium))
                                                        
                                                        Text("\(index.resultTp)")
                                                            .foregroundColor(.green)
                                                            .font(.system(size: 14, weight: .medium))
                                                    })
                                                }
                                                
                                                Text(index.resultDate)
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                            })
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .trailing, spacing: 8, content: {
                                                
                                                Text("\(index.resultP)")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 17, weight: .medium))
                                                
                                                Text("Down")
                                                    .foregroundColor(.red)
                                                    .font(.system(size: 13, weight: .regular))
                                            })
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                    })
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.getPodcasts()
        }
    }
}

#Preview {
    SignalsView()
}
