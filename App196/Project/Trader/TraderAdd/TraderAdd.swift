//
//  TraderAdd.swift
//  App196
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct TraderAdd: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: TraderViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Your Trader")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.gray)
                                .font(.system(size: 11, weight: .regular))
                                .padding(6)
                                .background(Circle().fill(.gray.opacity(0.2)))
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                .padding(.top)
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack(spacing: 45) {
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.name.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.name)
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        })
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Power")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                ForEach(viewModel.powers, id: \.self) { index in
                                
                                    Text(index)
                                        .foregroundColor(viewModel.power == index ? .black : .white)
                                        .font(.system(size: 14, weight: .medium))
                                        .padding(.horizontal)
                                        .frame(height: 40)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.power == index ? .white : .gray.opacity(0.1)))
                                        .onTapGesture {
                                            
                                            viewModel.power = index
                                        }
                                }
                            })
                        })
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addTrader {
                        
                        router.wrappedValue.dismiss()
                        
                        viewModel.fetchTraders()
                    }
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.name.isEmpty || viewModel.power.isEmpty ? 0.5 : 1)
                .disabled(viewModel.name.isEmpty || viewModel.power.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    TraderAdd(viewModel: TraderViewModel())
}
