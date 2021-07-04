//
//  AppDelegate.swift
//  Tempo-Task (iOS)
//
//  Created by Fady Ramzy on 04/07/2021.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
  
    // MARK: - Properties
    
    var window: UIWindow?
    
    // MARK: - Methods
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setupRootViewController()
        
        return true
    }
    
    
    func setupRootViewController() {
        let viewcontroller = NewsConfigurator.list.viewcontroller
        window?.rootViewController = viewcontroller
    }
}
