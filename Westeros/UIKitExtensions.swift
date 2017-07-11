//
//  UIKitExtensions.swift
//  Westeros
//
//  Created by Carlos on 11/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func wrappedInNavigation() -> UINavigationController{
        let nav = UINavigationController(rootViewController: self)
        return nav
    }
    
}
