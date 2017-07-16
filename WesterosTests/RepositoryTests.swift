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

    var localData : LocalFactory!
    
    var houses : [House]!
    var lannisterHouse : House?
    var wololoHouse : House?
    
    override func setUp() {
        super.setUp()
        
        localData = Repository.local
        
        houses = localData.houses
        lannisterHouse = localData.house(named: "Lannister")
        wololoHouse = localData.house(named: "Wololo")
    
    }
    
    override func tearDown() {
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
        var index = 0
        
        while index < houses.count - 1 {
            XCTAssertLessThanOrEqual(houses[index], houses[index+1])
            index += 1
        }
    }
    
    // Ejercicio - Filtrar una casa por un parámetro
    func testHouseFilter(){
        /*
        var housesFiltered : [House]
        
        housesFiltered = houses.filter {$0.name == "Stark"}
        XCTAssertEqual(housesFiltered.count, 1)
        
        housesFiltered = houses.filter {$0.count >= 4}
        print(housesFiltered)
        XCTAssertEqual(housesFiltered.count, 3)
        */
        
        
        XCTAssertEqual(localData.houses(filteredByName: "Stark")?.count, 1)
        XCTAssertEqual(localData.houses(filteredByMembersMoreThanOrEqualTo: 4)?.count, 3)

        XCTAssertEqual(localData.houses(filteredBy: EqualToHouseName)?.count, 1)
        XCTAssertEqual(localData.houses(filteredBy: moreThanOrEqualToMembers)?.count, 3)
        
    }
    
}









