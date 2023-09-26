//
//  LessonsDetail.swift
//  App196
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI
import AVKit

struct LessonsDetail: View {
    
    @Environment(\.presentationMode) var router
    
    let index: VideoItem
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Video")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium))
                    .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        VStack {
                            
                            if let url = URL(string: index.video ?? "") {
                                
                                VideoPlayer(player: AVPlayer(url: url))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 210)
                                    .cornerRadius(7)
                            }
                            
                            VStack(alignment: .leading, spacing: 10, content: {
                                
                                Text(index.title ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                
                                Text("Video's duration is: \(index.duration ?? 0)")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                            })
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 7).fill(.gray.opacity(0.1)))
                        
                        VStack(spacing: 5) {
                            
                            Image("empty")
                                .padding(.bottom)
                            
                            Text("No any Comments")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                            
                            Text("No any comment on the post found")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding(.vertical, 100)
                    }
                    .padding()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LessonsDetail(index: VideoItem(id: 0, categoryId: 0, title: "dsam", image: "dp", video: "", duration: 0))
}
