//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by Carlos on 18/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit

final class ArrayDataSource<Element> : NSObject, UITableViewDataSource{
    
    // OJO CON NSObject, extender o morir!!!
    // Mejor descender de NSObject que implementar 666 métodos
    
    // Para el modelo de datos
    typealias Elements = [Element]
    // ¿Cómo decimos a ArrayDataSource qué hacer cuando le pidan una celda?
    // Sería bueno decirlo con un parámetro: clausura (haz ésto)
    // CellMaker es clausura (que genera la celda), lo que necesitemos nos llegará y ya lo usaremos
    // OJO: Para crear la celda necesitamos pedirsela a la tabla
    typealias CellMaker = (Element, UITableView) -> UITableViewCell
    
    // Y guardamos lo que hemos inicializado arriba
    private let _model : Elements
    private let _cellMaker : CellMaker
    
    init(model: Elements, cellMaker: @escaping CellMaker){
        _model = model
        _cellMaker = cellMaker
        
        super.init()
    }
    
    // Necesitamos 3 métodos para toda DataSource, aunque podrían ser más
    // 1. Número de secciones en un array, 1 en este ejemplo
    // 2. Número de filas (o celdas) hay por sección, tantas como hay en el modelo
    // 3. Crear la celda, averiguar cuál es el elemento (modelo) y luego aplicar clausura (_cellMaker)
    
    // Este método lo implementamos de forma voluntaria
    // Se puede omitir, ya que el valor por defecto es 1 igualmente
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Estos 2 métodos son necesarios de base
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let elt = _model[indexPath.row]
        return _cellMaker(elt, tableView)
    }
    
}










