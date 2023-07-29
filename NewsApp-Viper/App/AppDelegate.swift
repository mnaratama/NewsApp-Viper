//
//  AppDelegate.swift
//  NewsApp-Viper
//
//  Created by Naratama on 28/07/23.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appNavigationController: UINavigationController?
    var appTabBarController: TabBarViewController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = BaseViewController()
        window?.makeKeyAndVisible()
        
//        handleFirstScreen()
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        return true
    }

//    func handleFirstScreen() {
//        let home = HomeRouter.init().createModule()
//        let navigationController = UINavigationController(rootViewController: home)
//
//        navigationController.isNavigationBarHidden = true
//        navigationController.navigationBar.shadowImage = nil
//        navigationController.navigationBar.isTranslucent = true
//
//        appNavigationController = navigationController
//
//        self.window?.rootViewController = appNavigationController
//        self.window?.backgroundColor = UIColor.init(red: 0.87, green: 0.87, blue: 0.87, alpha: 1)
//        
//        tabBarController()
//    }
    
    func tabBarController(){
        appTabBarController = TabBarViewController()
        appTabBarController.selectedIndex = 0
        appNavigationController?.pushViewController(appTabBarController, animated: true)
    }


}

