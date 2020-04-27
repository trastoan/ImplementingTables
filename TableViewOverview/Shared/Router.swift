//
//  Router.swift
//  TableHandsOn
//
//  Created by Yuri on 26/04/20.
//  Copyright © 2020 academy. All rights reserved.
//

import UIKit

struct Router {
    enum Approach {
        case dynamicTable
        case staticTable
    }
    
    func mainController(approach: Approach) -> UIViewController {
        let navigation = configureNavigationController()
        var controller: UIViewController!
        
        switch approach {
        case .dynamicTable:
            let storyboard = UIStoryboard(name: "DynamicTable", bundle: nil)
            controller = storyboard.instantiateViewController(withIdentifier: "DynamicTableController")
        case .staticTable:
            let storyboard = UIStoryboard(name: "StaticTable", bundle: nil)
            controller = storyboard.instantiateViewController(withIdentifier: "StaticTableController")
        }
        
        navigation.viewControllers = [controller]
        
        return navigation
    }
    
    private func configureNavigationController() -> UINavigationController {
        let navigation = UINavigationController()
        navigation.navigationBar.titleTextAttributes = [.font : UIFont.systemFont(ofSize: 21, weight: .bold)]
        
        return navigation
    }
}

