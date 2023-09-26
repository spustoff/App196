//
//  Reviewers_1.swift
//  App196
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct Reviewers_1: View {
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image(.reviewers1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(spacing: 8, content: {
                    
                    Text("Trade by playing")
                        .foregroundColor(.black)
                        .font(.system(size: 26, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("12 Levels to Success")
                        .foregroundColor(.gray)
                        .font(.system(size: 17, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Reviewers_2()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    Reviewers_1()
}
