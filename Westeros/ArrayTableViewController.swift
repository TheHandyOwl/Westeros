//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by Carlos on 18/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController{

    let dataSource : ArrayDataSource<Element>
    let arrayDelegate : BaseViewControllerDelegate<Element>?
    
    init(dataSource: ArrayDataSource<Element>,
           delegate: BaseViewControllerDelegate<Element>? = nil,
              title: String,
              style: UITableViewStyle){
        
        self.dataSource = dataSource
        self.arrayDelegate = delegate
        super.init(style: style)
        self.tableView.dataSource = self.dataSource
        
        self.arrayDelegate?.viewController = self
        self.arrayDelegate?.source = dataSource
        
        self.tableView.delegate = self.arrayDelegate as? UITableViewDelegate
        
        self.title = title
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}










