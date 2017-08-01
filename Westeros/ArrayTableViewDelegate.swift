//
//  ArrayTableViewDelegate.swift
//  Westeros
//
//  Created by Carlos on 18/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit

final class ArrayTableViewDelegate<Element>: NSObject, UITableViewDelegate{
    
    typealias Elements = [Element]
    typealias NavMaker = (Element) -> ()
    
    let model : Elements
    let navMaker : NavMaker
    
    init(model: Elements, navMaker: @escaping NavMaker){
        self.model = model
        self.navMaker = navMaker
        
        super.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Qué pasa aquí dentro?
        let elt = self.model[indexPath.row]

        navMaker(elt)
    
    }
    
}
