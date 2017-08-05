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

extension String{
    
    func formatString2DateYYYYMMdd() -> Date{
        let tempDate = DateFormatter()
        tempDate.dateFormat = "YYYY-MM-dd"
        
        return tempDate.date(from: self)!
    }
    
}

extension Date{
    
    func formatDate2StringYYYYMMdd() -> String{
        let tempDate = DateFormatter()
        tempDate.dateFormat = "YYYY-MM-dd"
        
        return tempDate.string(from: self)
    }
    
}
