//
//  App196App.swift
//  App196
//
//  Created by Вячеслав on 9/24/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_wgsqiDz8wHPKfMRdhWMR337tn93Fyh")
        Amplitude.instance().initializeApiKey("4397b085fcf0149198b9aa23a07ef939")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App196App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
