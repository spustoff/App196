//
//  LessonsView.swift
//  App196
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct LessonsView: View {
    
    @StateObject var viewModel = LessonsViewModel()
    
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
                
                if viewModel.isLoading {
                    
                    ProgressView()
                        .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    if viewModel.lessons.isEmpty {
                        
                        VStack(spacing: 7, content: {
                            
                            Image("empty")
                            
                            Text("Empty Lessons")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                                .multilineTextAlignment(.center)
                            
                            Text("No any lesson right now")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                                .multilineTextAlignment(.center)
                        })
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.lessons, id: \.self) { index in
                                    
                                    VStack(spacing: 10) {
                                        
                                        WebPic(urlString: index.image ?? "", width: .infinity, height: 120, cornerRadius: 10, isPlaceholder: true)
                                        
                                        VStack(alignment: .leading, spacing: 15, content: {
                                            
                                            Text("\(index.duration ?? 0) minutes")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .regular))
                                            
                                            Text(index.title ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .medium))
                                                .lineLimit(1)
                                            
                                            Button(action: {
                                                
                                                viewModel.selectedLesson = index
                                                viewModel.isDetail = true
                                                
                                            }, label: {
                                                
                                                Text("Open")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 12, weight: .medium))
                                                    .frame(maxWidth: .infinity)
                                                    .frame(height: 40)
                                                    .background(RoundedRectangle(cornerRadius: 5).fill(Color("primary")))
                                            })
                                        })
                                    }
                                    .padding(.bottom, 5)
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.getCategories(category_id: "")
        }
        .sheet(isPresented: $viewModel.isDetail, content: {

            LessonsDetail(index: viewModel.selectedLesson)
        })
    }
}

#Preview {
    LessonsView()
}
