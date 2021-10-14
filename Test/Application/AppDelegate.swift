//
//  AppDelegate.swift
//  Test
//
//  Created by Алексей on 14.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        
        start()
        
        return true
    }
}

extension AppDelegate {
    func start() {
        switch GetIsUserAuthorizedManager().execute() {
        case let .success(isUserAuthorized):
            if isUserAuthorized {
                self.window?.rootViewController = MainViewController()
            } else {
                self.window?.rootViewController = SignInViewController()
            }
        case let .failure(error):
            print(error)
            
            switch ResetUserManager().execute() {
            case .success():
                break
            case let .failure(error):
                print(error)
            }
            
            self.window?.rootViewController = SignInViewController()
        }
    }
}
