//
//  LessonsViewModel.swift
//  App196
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI
import Alamofire

final class LessonsViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    
    @Published var lessons: [VideoItem] = []
    
    @Published var selectedLesson: VideoItem = VideoItem(id: 1, categoryId: 1, title: "", image: "", video: "", duration: 1)
    @Published var isDetail: Bool = false
    
    func getCategories(category_id: String) {
        
        isLoading = true
        
        self.fetchCategories(category_id: category_id) { result in
            
            switch result {
                
            case .success(let success):
                
                self.lessons = success.rows
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchCategories(category_id: String, completion: @escaping (Result<VideoModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "07028c02-35ef-42f2-afaf-439c58f50c1e",
            "category_id": category_id,
        ]
        
        let request = AF.request("https://beretesa.space/api/v2/video", method: .get, parameters: params)
        
        request.responseDecodable(of: VideoModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
                           
            switch response.result{
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
}
