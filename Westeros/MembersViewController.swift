//
//  MembersViewController.swift
//  Westeros
//
//  Created by Carlos on 18/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit


// MARK: - MembersVC Class

class MembersViewController: UITableViewController {
    
    let model : [Person]
    
    init(model: [Person]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "MemberCell"
        
        // Descubrir cuala es la persona que tenemos que mostrar
        let person = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            // La creo a pelo
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // sincronizar House -> Cell
        cell?.textLabel?.text = person.fullName
        
        return cell!
    }
    
    
    
}










