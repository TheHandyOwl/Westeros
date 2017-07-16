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
        XCTAssertEqual(houses.count, 6)
    }
    
    // Ejercicio - Devolver la casa a partir del nombre
    func testGetHouseFromName(){
        XCTAssertNotNil(lannisterHouse)
        XCTAssertNil(wololoHouse)
    }
    
    // Ejercicio - Devolver casas ordenadas
    func testCompareSortedHouses(){
        let housesA : [House] = Repository.local.houses
        let housesB : [House] = housesA
        
        for a in housesA{
            for b in housesB {
                if a < b{
                    //print ("Compare >> " + a.name + "<" + b.name)
                    XCTAssertLessThan(a.name, b.name)
                } else if a > b{
                    //print ("Compare >>: " + a.name + ">" + b.name)
                    XCTAssertGreaterThan(a.name, b.name)
                } else {
                    //print ("Compare >>: " + a.name + "==" + b.name)
                    XCTAssertEqual(a.name, b.name)
                }
            }
        }
    }
    
}
