//
//  TraderView.swift
//  App196
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct TraderView: View {
    
    @StateObject var viewModel = TraderViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                if viewModel.traders.isEmpty {
                    
                    Image(.people)
                    
                    VStack(spacing: 8, content: {
                        
                        Text("Oops, no traders")
                            .foregroundColor(.white)
                            .font(.system(size: 19, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("You don't have any trader yet. You can add by click a button at bottom")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    
                } else {
                    
                    TabView(content: {
                        
                        ForEach(viewModel.traders, id: \.self) { index in
                        
                            VStack(spacing: 30) {
                                
                                Image(.people)
                                
                                VStack(alignment: .center, spacing: 7, content: {
                                    
                                    Text("Name")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Text(index.name ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .semibold))
                                })
                                
                                VStack(alignment: .center, spacing: 7, content: {
                                    
                                    Text("Power")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Text(index.power ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .semibold))
                                })
                            }
                        }
                    })
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                }
                
                Button(action: {
                    
                    viewModel.isAdd = true
                    
                }, label: {
                    
                    Text("Make a New")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                        .padding(.top, 50)
                })
            }
        }
        .onAppear {
            
            viewModel.fetchTraders()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            TraderAdd(viewModel: viewModel)
        })
    }
}

#Preview {
    TraderView()
}
