//
//  LoadingView.swift
//  App196
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(colors: [Color("bg"), Color("primary")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            Image("logo_big")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            VStack {
                
                Spacer()
                
                ProgressView()
                
            }
            .padding()
        }
    }
}

#Preview {
    LoadingView()
}
