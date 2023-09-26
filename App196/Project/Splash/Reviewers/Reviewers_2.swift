//
//  Reviewers_2.swift
//  App196
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct Reviewers_2: View {
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image(.reviewers2)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(spacing: 8, content: {
                    
                    Text("Trade with power")
                        .foregroundColor(.black)
                        .font(.system(size: 26, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Virtual traders with superpowers")
                        .foregroundColor(.gray)
                        .font(.system(size: 17, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Reviewers_3()
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
    Reviewers_2()
}
