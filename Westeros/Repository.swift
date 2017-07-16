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
    func house(named: String) -> House?
    func houses(filteredByName: String) -> [House]?
    func houses(filteredByMembersMoreThanOrEqualTo: Int) -> [House]?
    
}

final class LocalFactory : HouseFactory{
    var houses: [House]{
        get{
            // Aquí es donde te creas tus casas
            // Sigils
            // ^^^^^^
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let mormontSigil = Sigil(image: #imageLiteral(resourceName: "mormont.png"), description: "Rampant bear")
            let greyjoySigil = Sigil(image: #imageLiteral(resourceName: "greyjoy.png"), description: "A golden kraken on a black field")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryen.png"), description: "A red three-headed dragon")
            let tyrellSigil = Sigil(image: #imageLiteral(resourceName: "tyrell.png"), description: "A golden rose on a green field")
            
            // Houses
            // ^^^^^^
            let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
            let lannister = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
            let mormont = House(name: "Mormont", sigil: mormontSigil, words: "Here we stand!")
            let greyjoy = House(name: "Greyjoy", sigil: greyjoySigil, words: "We Do Not Sow")
            let targaryen = House(name: "Targaryen", sigil: targaryenSigil, words: "Fire and Blood")
            let tyrell = House(name: "Tyrell", sigil: tyrellSigil, words: "Growing Strong")
            
            // Characters
            // ^^^^^^^^^^
            // ---- Stark ----
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            let sansa = Person(name: "Sansa", alias: "Little bird", house: stark)
            let brandon = Person(name: "Brandon", alias: "The winged wolf", house: stark)
            let rickon  = Person(name: "Rickon", house: stark)
            
            // ---- Lannister ----
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            let jaime = Person(name: "Jaime", alias: "KingSlayer", house: lannister)
            let tywin = Person(name: "Tywin", alias: "Lannister's Lion", house: lannister)
            
            // ---- Mormont ----
            let lyanna  = Person(name: "Lyanna", house: mormont)
            
            // ---- Greyjoy ----
            let asha  = Person(name: "Asha", alias: "Esgred", house: greyjoy)
            let theon  = Person(name: "Theon", alias: "Reek", house: greyjoy)
            let euron  = Person(name: "Euron III", alias: "Crow's Eye", house: greyjoy)
            
            // ---- Targaryen ----
            let daenerys  = Person(name: "Daenerys", alias: "Dragonmother", house: targaryen)
            let viserys  = Person(name: "Viserys", alias: "The Beggar King", house: targaryen)
            
            // ---- Tyrell ----
            let mace  = Person(name: "Mace", alias: "Lord Oaf", house: tyrell)
            let loras  = Person(name: "Loras", alias: "The Knight of Flowers", house: tyrell)
            let margaery  = Person(name: "Margaery", alias: "Little rose", house: tyrell)
            let olenna  = Person(name: "Olenna", alias: "Queen of Thorns", house: tyrell)
            
            // Añadir los personajes a las casas
            stark.add(person: robb)
            stark.add(person: arya)
            stark.add(person: sansa)
            stark.add(person: brandon)
            stark.add(person: rickon)
            
            
            lannister.add(person: tyrion)
            lannister.add(person: cersei)
            lannister.add(person: jaime)
            lannister.add(person: tywin)
            
            mormont.add(person: lyanna)
            
            greyjoy.add(person: asha)
            greyjoy.add(person: theon)
            greyjoy.add(person: euron)
            
            targaryen.add(person: daenerys)
            targaryen.add(person: viserys)
            
            tyrell.add(person: mace)
            tyrell.add(person: loras)
            tyrell.add(person: margaery)
            tyrell.add(person: olenna)
            
            
            // Esto queda pendiente de comprobar con un test
            return [stark, lannister, mormont, greyjoy, targaryen, tyrell].sorted()
            
        }
    }
}

extension LocalFactory{
    func house(named: String) -> House?{
        return houses.first {$0.name == named}
    }
}

extension LocalFactory{
    func houses(filteredByName filter: String) -> [House]?{
        return houses.filter {$0.name == filter}
    }
    func houses(filteredByMembersMoreThanOrEqualTo filter: Int) -> [House]?{
        return houses.filter {$0.count >= filter}
    }
}
