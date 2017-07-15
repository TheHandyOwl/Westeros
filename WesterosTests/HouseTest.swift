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
    
    var starkImage : UIImage!
    var lannisterImage : UIImage!
    
    var starkSigil : Sigil!
    var lannisterSigil : Sigil!
    
    var starkHouse : House!
    var lannisterHouse : House!
    
    var robb : Person!
    var arya: Person!
    var tyrion : Person!
    
    override func setUp() {
        super.setUp()
        
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(image: starkImage, description: "Direwolf")
        lannisterSigil = Sigil(image: lannisterImage, description: "Rampant Lion")
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
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
        XCTAssertEqual(starkHouse.count, 0)
        starkHouse.add(person: robb)
        
        XCTAssertEqual(starkHouse.count, 1)
        starkHouse.add(person: arya)
        
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person: tyrion) // Esto es erróneo porque no pertenece a esta casa
        XCTAssertEqual(starkHouse.count, 2) // Este test debería mantenerse en 2 y no en 3
        
    }
    
    // Mi solución para el test House
    func testCompareHouse(){
        XCTAssertLessThan(lannisterHouse, starkHouse)
        XCTAssertLessThanOrEqual(lannisterHouse, lannisterHouse)
        XCTAssertGreaterThan(starkHouse, lannisterHouse)
        XCTAssertGreaterThanOrEqual(starkHouse, starkHouse)
    }
    
    // Solución para el test House - Equality
    func testPersonEquality(){
        
        //Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        
        // Igualdad
        // jinxed = gafado
        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
        XCTAssertEqual(jinxed, starkHouse)
        
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
    
}
