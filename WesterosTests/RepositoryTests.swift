//
//  RepositoryTests.swift
//  Westeros
//
//  Created by Carlos on 11/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {

    var houses : [House]!
    var lannisterHouse : House?
    var wololoHouse : House?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        houses = Repository.local.houses
        lannisterHouse = Repository.local.house(named: "Lannister")
        wololoHouse = Repository.local.house(named: "Wololo")
    
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Repositorio Local
    func testLocalRepositoryCreation(){
        XCTAssertNotNil(Repository.local)
    }
    
    // Repositorio Local
    func testLocalRepositoryHousesCreation(){
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 3)
    }
    
    // Ejercicio - Devolver la casa a partir del nombre
    func testGetHouseFromName(){
        XCTAssertNotNil(lannisterHouse)
        XCTAssertNil(wololoHouse)
    }
    
}
