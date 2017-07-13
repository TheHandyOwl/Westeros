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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 2)
    }
    
    // Ejercicio - Devolver la casa a partir del nombre
    func testGetHouseFromName(){
        let lannister = Repository.local.house(named: "Lannister")
        XCTAssertNotNil(lannister)

        let wololo = Repository.local.house(named: "Wololo")
        XCTAssertNil(wololo)
    }
    
}
