//
//  Delegates.swift
//  Westeros
//
//  Created by Carlos on 18/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit

class BaseViewControllerDelegate<Element>: NSObject{
    var source : ArrayDataSource<Element>?
    var viewController : UIViewController?
}

final class HousesDelegate: BaseViewControllerDelegate<House>, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let house = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            
            let vc = HouseViewController(model: house)
            nav.pushViewController(vc, animated: true)
        }
    }
    
}

final class SeasonsDelegate: BaseViewControllerDelegate<Season>, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let season = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            
            let vc = SeasonViewController(model: season)
            nav.pushViewController(vc, animated: true)
        }
    }
    
}
