//
//  SceneDelegate.swift
//  TableViewOverview
//
//  Created by Yuri on 26/04/20.
//  Copyright © 2020 academy. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window?.windowScene = windowScene
        let router = Router()
        window?.rootViewController = router.mainController(approach: .staticTable)
        
        window?.makeKeyAndVisible()
    }
    
}

