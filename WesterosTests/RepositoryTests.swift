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

    
    // MARK: - Environment
    
    // MARK: - Local Repository Variables
    var localData : LocalFactory!
    
    // MARK: - Houses and Persons Variables
    var houses : [House]!
    var lannisterHouse : House?
    var wololoHouse : House?
    
    // MARK: - Seasons and Episodes Variables
    var seasons : [Season]!
    var firstSeason : Season?
    var wololoSeason : Season?
    
    // MARK: - Local Repository Environment
    override func setUp() {
        super.setUp()
        
        // Repo
        localData = Repository.local
        
        //Houses
        houses = localData.houses
        lannisterHouse = localData.house(named: "Lannister")
        wololoHouse = localData.house(named: "Wololo")
        
        //Seasons
        seasons = localData.seasons
        firstSeason = localData.season(numbered: 1) // Sí que existe
        wololoSeason = localData.season(numbered: 0) // No existe
    
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    // MARK: - Tests
    
    // MARK: - Local Repository Tests
    
    // Repositorio Local
    func testLocalRepositoryCreation(){
        XCTAssertNotNil(Repository.local)
    }
    
    // MARK: - Houses and Persons Tests
    
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
        /*
        var index = 0
        
        while index < houses.count - 1 {
            XCTAssertLessThanOrEqual(houses[index], houses[index+1])
            index += 1
        }
        */
        XCTAssertEqual(localData.houses, localData.houses.sorted())
    }
    
    // Ejercicio - Filtrar una casa por un parámetro
    func testHouseFilter(){
        var housesFiltered : [House]
        
        /*
        housesFiltered = houses.filter {$0.name == "Stark"}
        XCTAssertEqual(housesFiltered.count, 1)
        
        housesFiltered = houses.filter {$0.count >= 4}
        XCTAssertEqual(housesFiltered.count, 3)
        */
        
        
        XCTAssertEqual(localData.houses(filteredByName: "Stark")?.count, 1)
        XCTAssertEqual(localData.houses(filteredByMembersMoreThanOrEqualTo: 4)?.count, 3)

        //XCTAssertEqual(localData.houses(filteredBy: EqualToHouseName)?.count, 1)
        //XCTAssertEqual(localData.houses(filteredBy: moreThanOrEqualToMembers)?.count, 3)
        
        // Solución revisada
        
        housesFiltered = houses.filter { $0.count == 1 }
        XCTAssertEqual(housesFiltered.count, 1)
        housesFiltered = localData.houses(filteredBy: { $0.count == 1 })
        XCTAssertEqual(housesFiltered.count, 1)
    }
    
    func testHouseNamed() {
        
        let houseOne = localData.houses[0].name
        let personOne = localData.house(named: houseOne)?.sortedMembers().first
        let houseTwo = localData.houses[1].name
        let personTwo = localData.house(named: houseTwo)?.sortedMembers().first
        
        XCTAssertNotNil(localData.house(named: houseOne))
        XCTAssertNotNil(localData.house(named: houseTwo))
        XCTAssertEqual(personOne?.house, localData.house(named: houseOne))
        XCTAssertEqual(personTwo?.house, localData.house(named: houseTwo))
        XCTAssertEqual(localData.house(named: houseOne), localData.house(named: houseOne))
        XCTAssertNotEqual(personOne?.house, localData.house(named: houseTwo))
        XCTAssertNil(localData.house(named: "WololoHouse"))
        
    }
    
    
    // MARK: - Seasons and Episodes Tests
    
    // Existen las temporadas y son 7
    func testLocalRepositorySeasonsCreation(){
        XCTAssertNotNil(seasons)
        XCTAssertEqual(seasons.count, 7)
    }

    // Devolver la temporada a partir del número
    func testGetSeasonFromNumber(){
        XCTAssertNotNil(firstSeason)
        XCTAssertNil(wololoSeason)
    }

    // Devolver temporadas ordenadas
    func testCompareSortedSeasons(){
        XCTAssertEqual(localData.seasons, localData.seasons.sorted())
    }

    // Filtrar una temporada por un parámetro
    func testSeasonFilter(){
        var seasonsFiltered : [Season]
        
        seasonsFiltered = seasons.filter { $0.count == 10 }
        XCTAssertEqual(seasonsFiltered.count, 6)
        seasonsFiltered = localData.seasons(filteredBy: { $0.count == 10 })
        XCTAssertEqual(seasonsFiltered.count, 6)
        
        seasonsFiltered = seasons.filter { $0.count == 7 }
        XCTAssertEqual(seasonsFiltered.count, 1)
        seasonsFiltered = localData.seasons(filteredBy: { $0.count == 7 })
        XCTAssertEqual(seasonsFiltered.count, 1)
    }

}









