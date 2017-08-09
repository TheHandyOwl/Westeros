//
//  HousesViewController.swift
//  Westeros
//
//  Created by Carlos on 17/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit


// MARK: - HousesVC Class

class HousesViewController: UITableViewController {

    let model : [House]
    
    init(model: [House]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // UITableView: El primer parámetro es con quién estamos hablando
        // UITableViewCell: El segundo parámetro indica la celda en formato objeto (section/row)
        
        // Variables para usar luego
        let cellID = "HouseCell"
        
        // Descubrir qué casa tenemos que mostrar
        let house = model[indexPath.row]
        
        // Crear una celda
        // De momento usamos la forma sencilla, sin distinguir tipos de celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil{
            // La creo a pelo
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // Sincronizar House -> Cell
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        
        // Return
        return cell!
        
    }
    
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        // La tabla tal seleccionó la celda tal
        
        // Averiguamos la casa
        let house = model[indexPath.row]
        
        // La mostramos
        let houseVC = HouseViewController(model: house)
        navigationController?.pushViewController(houseVC, animated: true)
    }


}









