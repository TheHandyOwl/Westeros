//
//  SeasonTest.swift
//  Westeros
//
//  Created by Carlos on 3/8/17.
//  Copyright © 2017 THO. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTest: XCTestCase {
    
    // MARK: - Environment
    
    // Repo
    var localData : LocalFactory!
    
    // Seasons
    var season1 : Season!
    var season2 : Season!
    
    // Episodes
    var episode_1_1 : Episode!
    var episode_1_2 : Episode!
    var episode_1_3 : Episode!
    
    var episode_2_1 : Episode!
    var episode_2_2 : Episode!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    
        localData = Repository.local
        
        season1 = Season(numberOf: 1, name: "Season 1", releaseDateFromString: "2011-04-17")
        season2 = Season(numberOf: 2, name: "Season 2", releaseDateFromString: "2012-04-01")
        
        episode_1_1 = Episode(numberOf: 1, title: "Winter Is Coming", broadcastDateFromString: "2011-04-17", episodeFromSeason: season1)
        episode_1_2 = Episode(numberOf: 2, title: "The Kingsroad", broadcastDateFromString: "2011-04-18", episodeFromSeason: season1)
        episode_1_3 = Episode(numberOf: 3, title: "Lord Snow", broadcastDateFromString: "2011-04-19", episodeFromSeason: season1)
        
        episode_2_1 = Episode(numberOf: 1, title: "The North Remembers", broadcastDateFromString: "2012-04-01", episodeFromSeason: season2)
        episode_2_2 = Episode(numberOf: 2, title: "The Night Lands", broadcastDateFromString: "2012-04-02", episodeFromSeason: season2)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSeasonExistence() {
        XCTAssertNotNil(season1)
    }
    
    
    // MARK: - Tests
    
    func testAddEpisodes() {
        
        XCTAssertEqual(season1.count, 0)
        XCTAssertEqual(season2.count, 0)
        
        // Añade 1
        season1.add(episode: episode_1_1)
        XCTAssertEqual(season1.count, 1)
        
        season1.add(episode: episode_1_2)
        XCTAssertEqual(season1.count, 2)
        
        season1.add(episode: episode_1_3)
        XCTAssertEqual(season1.count, 3)
        
        // Añade muchos
        season2.add(episodes: episode_2_1, episode_2_2)
        XCTAssertEqual(season2.count, 2)
        
        // Este no debería añadir el episodio
        XCTAssertEqual(season1.count, 3)
        season1.add(episode: episode_2_1)
        XCTAssertEqual(season1.count, 3)
        
    }
    
    func testHashableSeason() {
        XCTAssertNotNil(season1.hashValue)
    }
    
    func testSeasonEquality(){
        
        //Comparación
        XCTAssertLessThan(season1, season2)
        XCTAssertLessThanOrEqual(season1, season1)
        XCTAssertGreaterThan(season2, season1)
        XCTAssertGreaterThanOrEqual(season1, season1)
        
        //Identidad
        XCTAssertEqual(season1, season1)
        
        // Igualdad
        let sameSeason = season1
        XCTAssertEqual(sameSeason, season1)
        
        // Desigualdad
        XCTAssertNotEqual(season1, season2)
        
    }
    
    func testSeasonDescription(){
        XCTAssertEqual(season1.description, "<T1> Season 1")
    }
    
    func testSeasonsImages() {
        let numberImages = localData.seasons.map { $0.numberImage }
        for numberImage in numberImages {
            XCTAssertNotNil(numberImage)
        }
    }
    
}
