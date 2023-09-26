//
//  TraderViewModel.swift
//  App196
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI
import CoreData

final class TraderViewModel: ObservableObject {
    
    @Published var isAdd: Bool = false
    
    @Published var traders: [TraderModel] = []
    
    @Published var name: String = ""
    @Published var power: String = ""
    
    @Published var powers: [String] = ["market forecast", "analyzing data", "trend forecaster", "rational solutions", "trading strategy"]
    
    func addTrader(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "TraderModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "TraderModel", into: context) as! TraderModel
        
        trans.name = name
        trans.power = power
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchTraders() {
        
        CoreDataStack.shared.modelName = "TraderModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TraderModel>(entityName: "TraderModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.traders = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.traders = []
        }
    }
}
