//
//  PersonTest.swift
//  Westeros
//
//  Created by Carlos on 6/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTest: XCTestCase {
    
    
    // MARK: - Environment
    
    // MARK: - Local Repository Variables
    var localData : LocalFactory!
    
    var starkImage : UIImage!
    var lannisterImage : UIImage!
    
    var starkSigil : Sigil!
    var lannisterSigil : Sigil!
    
    var starkHouse : House!
    var lannisterHouse : House!
    
    var robb : Person!
    var arya: Person!
    var tyrion : Person!
    
    var ned : Person!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        localData = Repository.local

        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(image: starkImage, description: "Direwolf")
        lannisterSigil = Sigil(image: lannisterImage, description: "Rampant Lion")
        
        let starkURL = URL(string: "https://google.es")!
        let lannisterURL = URL(string: "https://google.es")!
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url: starkURL)
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", url: lannisterURL)
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    // MARK: - Tests
    
    func testPersonExistence(){
        // let ned = Character(name: "Eddard", alias: "Ned", house: starkHouse)
        // Para evitar el conflicto de Character vs Westeros.Character
        // Lo suyo es refactorizar
        XCTAssertNotNil(tyrion)
    }
    
    func testFullName(){
        // let ned = Character(name: "Eddard", alias: "Ned", house: starkHouse)
        // Para evitar el conflicto de Character vs Westeros.Character
        // Lo suyo es refactorizar
        XCTAssertEqual(tyrion.fullName, "Tyrion Lannister")
    }
    
    func testHashablePerson() {
        XCTAssertNotNil(robb.hashValue)
    }
    
    // Mi solución para el test Person
    func testComparePerson(){
        XCTAssertLessThan(arya, robb)
        XCTAssertLessThanOrEqual(arya, arya)
        XCTAssertGreaterThan(tyrion, robb)
        XCTAssertGreaterThanOrEqual(tyrion, tyrion)
    }
    
    // Solución para el test Person
    func testPersonEquality(){
        
        //Identidad
        XCTAssertEqual(tyrion, tyrion)
        
        // Igualdad
        let imp = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        XCTAssertEqual(imp, tyrion)
        
        // Desigualdad
        XCTAssertNotEqual(tyrion, arya)
        
    }
    
}










