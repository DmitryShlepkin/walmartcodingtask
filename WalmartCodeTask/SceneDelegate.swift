//
//  SceneDelegate.swift
//  WalmartCodeTask
//
//  Created by Dmitry Shlepkin on 3/12/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        /*
         I created nav controller and vc right here because app has only one screen
         and just to save time, otherwise it's a good idea to put nav controller
         and module builder into router and use it for navigation.
         */
        let navigationController = UINavigationController()
        let moduleBuilder = ModuleBuilder()
        let vc = moduleBuilder.createCountryList()
        navigationController.pushViewController(vc, animated: false)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}

}

