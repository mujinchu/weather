//
//  AppDelegate.swift
//  weather
//
//  Created by cui on 2023/4/17.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let nav = UINavigationController(rootViewController: CityListViewController())
        window?.rootViewController = nav
        
        window?.makeKeyAndVisible()
        return true
    }
}

