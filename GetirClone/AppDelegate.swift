//
//  AppDelegate.swift
//  GetirClone
//
//  Created by Ali Eren on 14.08.2022.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?)
    -> Bool {
        
        FirebaseApp.configure()
        
        self.window = self.window ?? UIWindow()
        
        // Create a ViewController object and set it as self.window's root view controller.
        self.window!.rootViewController = MainCategoryViewController()
        
        // Make the window be visible.
        self.window!.makeKeyAndVisible()
        
        return true
    }
    
    
}

