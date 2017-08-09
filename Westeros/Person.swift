//
//  Character.swift
//  Westeros
//
//  Created by Carlos on 6/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import Foundation


// MARK: - Person Class

final class Person{
    
    let name    : String
    let house   : House
    private let _alias   : String? // Al definirlo como opcional tiene un valor nil automáticamente
    // Por convención le ponemos el '_' para diferenciarla del 'getter' que definiremos luego
    // Al ser opcional en vez de un alias devolverá una cadena vacía

    
    // Propiedad computada
    var alias : String{
        get{
            // Este if hace asignación si el _alias tiene una cadena
            // La comparación es un booleano, no puede comparar una cadena
            // No se puede poner if _alias { return _alias } pq _alias no es booleano
            /*
            //if let theAlias = _alias{
            if let _alias = _alias{
                // nExiste! y está en theAlias
                return _alias
            } else {
                return ""
            }
            */
            return _alias ?? ""
        }
    }
    
    // Inicializador designado
    init(name: String, alias: String?, house: House) {
        
        self.name = name
        _alias = alias
        self.house = house
    }
    
    // Otro inicializador designado sin el alias
    // command + shift + 7 comenta la selección
    convenience init(name: String, house: House){
        self.init(name: name, alias: nil, house: house)
    }
    
    // Inicializador de conveniencia
    // En este caso es tontería porque sólo pasaríamos 1 cadena, como en el segundo designado
    
}


// MARK: - Person Extensions

// Dejamos la clase y el resto de funcionalidades las metemos en extensiones
extension Person{
    var fullName : String{
        return "\(name) \(house.name)"
    }
}

extension Person {
    var proxy : String{
        return "\(name) \(alias) \(house.name)"
    }
}

extension Person : Hashable{
    
    var hashValue: Int {
        get{
            // let proxy = "\(name) \(_alias) \(house.name)"
            return proxy.hashValue
        }
    }

}

extension Person : Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool{
        return lhs.proxy == rhs.proxy
    }
}

extension Person : Comparable{
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy < rhs.proxy
    }
    static func <=(lhs: Person, rhs: Person) -> Bool{
        return lhs.proxy <= rhs.proxy
    }
    static func >=(lhs: Person, rhs: Person) -> Bool{
        return lhs.proxy >= rhs.proxy
    }
    static func >(lhs: Person, rhs: Person) -> Bool{
        return lhs.proxy > rhs.proxy
    }
}











