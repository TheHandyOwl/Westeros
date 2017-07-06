//
//  House.swift
//  Westeros
//
//  Created by Carlos on 6/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit

// MARK: - Classes
// typealias House = String
// typealias Sigil = String
// typealias Character = String
typealias Words = String
// Como no tenemos claro el tipo de dato que será 'Members', por el momento hacemos un conjunto de personas
typealias Members = Set<Person>

final class House{
   
    let name    : String
    let sigil   : Sigil
    let words   : Words
    private var _members : Members
    
    init(name: String, sigil: Sigil, words: Words){
        (self.name, self.sigil, self.words) = (name, sigil, words)
        _members = Members()
    }
}

final class Sigil{
    let description : String
    let image       : UIImage
    
    init(image: UIImage, description: String) {
        (self.image, self.description) = (image, description)
    }
}


extension House{
    var count : Int{
        return _members.count
    }
    
    func add(person: Person){
        
        //guard person.house == self else { // self no es equatable, tenemos que implementarlo
        guard person.house.name == name else { // como no hay tiempo probamos con otro y queda pendiente que desarrollemos el punto anterios
            return // Aquí saldríamos y no haríamos nada
        }
        _members.insert(person)
    }
}









