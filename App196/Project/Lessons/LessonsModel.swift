//
//  LessonsModel.swift
//  App196
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI

struct VideoModel: Codable, Hashable {
    
    var errors: Bool
    
    var rows: [VideoItem]
}

struct VideoItem: Codable, Hashable {
    
    var id: Int?
    var categoryId: Int?
    var title: String?
    var image: String?
    var video: String?
    
    var duration: Int?
}
