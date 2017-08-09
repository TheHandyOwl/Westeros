//
//  HouseTest.swift
//  Westeros
//
//  Created by Carlos on 6/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import XCTest
@testable import Westeros

class HouseTest: XCTestCase {
    
    
    // MARK: - Environment
    
    // MARK: - Local Repository Variables
    var localData : LocalFactory!
    
    var starkSigil : Sigil!
    var lannisterSigil : Sigil!
 
    var starkHouse : House!
    var lannisterHouse : House!
    
    var robb : Person!
    var arya: Person!
    var tyrion : Person!
    
    override func setUp() {
        super.setUp()
        
        localData = Repository.local
        
        starkHouse = localData.house(named: "Stark")
        lannisterHouse = localData.house(named: "Lannister")
        
        starkSigil = starkHouse.sigil
        lannisterSigil = lannisterHouse.sigil
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
    }
    
    override func tearDown() {
        super.tearDown()
    }

    
    // MARK: - Tests
    
    func testHouseExistence(){
        XCTAssertNotNil(starkHouse)
    }
    
    func testSigilExistence(){
        starkSigil = starkHouse.sigil
        XCTAssertNotNil(starkSigil)
        
        lannisterSigil = lannisterHouse.sigil
        XCTAssertNotNil(lannisterSigil)
    }
    
    func testAddPersons(){
        //XCTAssertEqual(starkHouse.count, 0)
        XCTAssertEqual(starkHouse.count, 5)
        starkHouse.add(person: robb) // Esta persona ya está añadida
        
        //XCTAssertEqual(starkHouse.count, 1)
        XCTAssertEqual(starkHouse.count, 5)
        starkHouse.add(person: arya) // Esta persona ya está añadida
        
        //XCTAssertEqual(starkHouse.count, 2)
        XCTAssertEqual(starkHouse.count, 5)
        
        starkHouse.add(persons: robb, arya)  // Estas personas ya están añadidan
        XCTAssertEqual(starkHouse.count, 5)
        
        starkHouse.add(person: tyrion) // Esto es erróneo porque no pertenece a esta casa
        //XCTAssertEqual(starkHouse.count, 2) // Este test debería mantenerse en 2 y no en 3
        XCTAssertEqual(starkHouse.count, 5)
        
    }
    
    // Mi solución para el test House
    func testCompareHouse(){
        XCTAssertLessThan(lannisterHouse, starkHouse)
        XCTAssertLessThanOrEqual(lannisterHouse, lannisterHouse)
        XCTAssertGreaterThan(starkHouse, lannisterHouse)
        XCTAssertGreaterThanOrEqual(starkHouse, starkHouse)
    }
    
    // Solución para el test House - Equality
    func testHouseEquality(){
        
        //Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        
        // Igualdad
        // jinxed = gafado
        //let jinxed = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
        //XCTAssertEqual(jinxed, starkHouse)
        
        // Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    // Solución para el test House - Hashable
    func testHashable(){
        XCTAssertNotNil(starkHouse.hashValue)
    }
    
    // Solución para el test House - Comparable
    func testHouseComparison(){
        XCTAssertLessThan(lannisterHouse, starkHouse)
        XCTAssertLessThanOrEqual(lannisterHouse, lannisterHouse)
        XCTAssertGreaterThan(starkHouse, lannisterHouse)
        XCTAssertGreaterThanOrEqual(starkHouse, starkHouse)
    }
    
    func testPersonsOfHouseSorted(){
        XCTAssertEqual(starkHouse.sortedMembers().sorted(), starkHouse.sortedMembers())
    }
    
    func testWikiUrls() {
        let urls : [URL] = localData.houses.map{ $0.wikiURL }
        for url in urls {
            XCTAssertNotNil(url)
        }
    }
    
    func testImagesHouses() {
        for house in localData.houses {
            XCTAssertNotNil(house.sigil.image)
        }
    }
    
}









