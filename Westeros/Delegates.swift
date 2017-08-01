//
//  Delegates.swift
//  Westeros
//
//  Created by Carlos on 18/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit

final class Delegates{

    static func housesDelegate(model: [House]) -> ArrayTableViewDelegate<House>{
        
        // Qué va aqui???
        
        return ArrayTableViewDelegate(model: model, navMaker: { (house: House) in
            
            let houseVC = HouseViewController(model: house)
            let mainController = UIApplication.mainViewController()
            
            mainController?.navigationController?.pushViewController(houseVC, animated: true)
            
        })
        
    }

}

extension UIApplication {
    class func mainViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return mainViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return mainViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return mainViewController(base: presented)
        }
        return base
    }
}
