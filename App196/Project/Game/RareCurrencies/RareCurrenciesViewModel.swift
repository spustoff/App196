//
//  RareCurrenciesViewModel.swift
//  App196
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI
import Alamofire

final class RareCurrenciesViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var signals: [DiscoveryItem] = []
    
    @Published var selectedSignal: DiscoveryItem = DiscoveryItem(resultHash: "", resultInstrument: "", resultPeriod: "", resultTp: 0, resultSl: 0, resultP: 0, resultSignal: "", resultDate: "")
    @Published var isDetail: Bool = false
    
    func getPodcasts() {
        
        isLoading = true
        
        self.fetchPodcasts() { result in
            
            switch result {
                
            case .success(let success):
                
                self.signals = success.results
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchPodcasts(completion: @escaping (Result<DiscoveryModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "07028c02-35ef-42f2-afaf-439c58f50c1e",
        ]
        
        let request = AF.request("https://beretesa.space/api/v2/signals", method: .get, parameters: params)
        
        request.responseDecodable(of: DiscoveryModel.self) { response in
            
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
