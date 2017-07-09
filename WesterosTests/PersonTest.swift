//
//  CharacterTest.swift
//  Westeros
//
//  Created by Carlos on 6/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTest: XCTestCase {
    
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
        
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(image: starkImage, description: "Direwolf")
        lannisterSigil = Sigil(image: lannisterImage, description: "Rampant Lion")
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!")
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
        ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
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
    
    func testPersonExistence(){
        
        // let ned = Character(name: "Eddard", alias: "Ned", house: starkHouse)
        // Para evitar el conflicto de Character vs Westeros.Character
        // Lo suyo es refactorizar
        XCTAssertNotNil(ned)
    }
    
    func testFullName(){
        
        // let ned = Character(name: "Eddard", alias: "Ned", house: starkHouse)
        // Para evitar el conflicto de Character vs Westeros.Character
        // Lo suyo es refactorizar
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
    
    func testComparePerson(){
        XCTAssertLessThan(arya, robb)
        XCTAssertLessThanOrEqual(arya, arya)
        XCTAssertGreaterThan(tyrion, robb)
        XCTAssertGreaterThanOrEqual(tyrion, tyrion)
    }

}
