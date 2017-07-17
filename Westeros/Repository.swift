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
    //func houses(filteredBy: (House) -> Bool) -> [House]?

    typealias Filter = (House) -> Bool
    func houses(filteredBy: Filter) -> [House]
    
}

final class LocalFactory : HouseFactory{
    
    var houses: [House]{
        get{
            // Aquí es donde te creas tus casas
            // Sigils
            // ^^^^^^
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let mormontSigil = Sigil(image: #imageLiteral(resourceName: "mormont.png"), description: "Rampant bear")
            let greyjoySigil = Sigil(image: #imageLiteral(resourceName: "greyjoy.png"), description: "A golden kraken on a black field")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryen.png"), description: "A red three-headed dragon")
            let tyrellSigil = Sigil(image: #imageLiteral(resourceName: "tyrell.png"), description: "A golden rose on a green field")
            
            // URLs
            // ^^^^
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let mormontURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Mormont")!
            let greyjoykURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Greyjoy")!
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            let tyrellURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Tyrell")!
            
            // Houses
            // ^^^^^^
            let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url: starkURL)
            let lannister = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", url: lannisterURL)
            let mormont = House(name: "Mormont", sigil: mormontSigil, words: "Here we stand!", url: mormontURL)
            let greyjoy = House(name: "Greyjoy", sigil: greyjoySigil, words: "We Do Not Sow", url: greyjoykURL)
            let targaryen = House(name: "Targaryen", sigil: targaryenSigil, words: "Fire and Blood", url: targaryenURL)
            let tyrell = House(name: "Tyrell", sigil: tyrellSigil, words: "Growing Strong", url: tyrellURL)
            
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
            /*
            stark.add(person: robb)
            stark.add(person: arya)
            stark.add(person: sansa)
            stark.add(person: brandon)
            stark.add(person: rickon)
            */
            // Variatic version
            stark.add(persons: robb, arya, sansa, brandon, rickon)
            
            /*
            lannister.add(person: tyrion)
            lannister.add(person: cersei)
            lannister.add(person: jaime)
            lannister.add(person: tywin)
            */
            lannister.add(persons: tyrion, cersei, jaime, tywin)
            
            mormont.add(person: lyanna)
            
            /*
            greyjoy.add(person: asha)
            greyjoy.add(person: theon)
            greyjoy.add(person: euron)
            */
            greyjoy.add(persons: asha, theon, euron)
            
            /*
            targaryen.add(person: daenerys)
            targaryen.add(person: viserys)
            */
            targaryen.add(persons: daenerys, viserys)
            
            /*
            tyrell.add(person: mace)
            tyrell.add(person: loras)
            tyrell.add(person: margaery)
            tyrell.add(person: olenna)
            */
            tyrell.add(persons: mace, loras, margaery, olenna)
            
            // Esto queda pendiente de comprobar con un test
            // Aquí estamos ordenando. Si queremos estar seguros 
            // el test es comparar las casas que tenemos (que ya vienen ordenadas)
            // y las volvemos a ordenar para comparar
            return [stark, lannister, mormont, greyjoy, targaryen, tyrell].sorted()
            
        }
    }
}

extension LocalFactory{
    func house(named: String) -> House?{
        // Ambas sirven
        // return houses.first {$0.name == named}
        // Variante
        // return houses.first {$0.name.uppercased() == named.uppercased()}
        let house = houses.filter{$0.name.uppercased() == named.uppercased()}.first
        return house
    }
}

extension LocalFactory{
    
    func houses(filteredByName filter: String) -> [House]?{
        return houses.filter {$0.name == filter}
    }
    func houses(filteredByMembersMoreThanOrEqualTo filter: Int) -> [House]?{
        return houses.filter {$0.count >= filter}
    }
    /*
    func houses(filteredBy: (House) -> Bool) -> [House]?{
        return houses.filter { filteredBy($0) }
    }
 */
    func houses(filteredBy: Filter) -> [House]{
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }
   
}

func EqualToHouseName(_ house: House) -> Bool {
    return (house.name == "Stark" ? true : false)
}
func moreThanOrEqualToMembers(_ house: House) -> Bool {
    return (house.count >= 4 ? true : false)
}
func lessThanOrEqualToMembers(_ house: House) -> Bool {
    return (house.count <= 1 ? true : false)
}










