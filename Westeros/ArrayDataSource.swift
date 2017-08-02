//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by Carlos on 18/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit

final class ArrayDataSource<Element> : NSObject, UITableViewDataSource{
    
    typealias elementsArray = [Element]
    typealias CellMaker = (Element, UITableView) -> UITableViewCell
    
    private let _model : elementsArray
    private let _cellMaker : CellMaker
    
    init(model: elementsArray, cellMaker: @escaping CellMaker){
        _model = model
        _cellMaker = cellMaker
        // super.init() // Parece que no hace falta llamar al super
    }

    func element(atIndexPath indexPath: IndexPath)->Element{
        return _model[indexPath.row]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let elt = element(atIndexPath: indexPath)
        return _cellMaker(elt, tableView)
    }
    
}










