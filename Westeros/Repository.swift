//
//  Repository.swift
//  Westeros
//
//  Created by Carlos on 11/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import Foundation

final class Repository{

    static let local = LocalFactory()
    
}

protocol HouseFactory {
    
    var houses : [House] { get }
    
}

final class LocalFactory : HouseFactory{
    var houses: [House]{
        get{
            // Aquí es donde te creas tus casas
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            
            let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
            let lannister = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            
            // Añadir los personajes a las casas
            stark.add(person: robb)
            stark.add(person: arya)
            lannister.add(person: tyrion)
            lannister.add(person: cersei)
            
            // Esto queda pendiente de comprobar con un test
            return [stark, lannister].sorted()
            
        }
    }
}
