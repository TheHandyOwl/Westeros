//
//  EpisodeTest.swift
//  Westeros
//
//  Created by Carlos on 4/8/17.
//  Copyright © 2017 THO. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTest: XCTestCase {
    
    // MARK: - Local Repository Variables
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
    
    
    func testEpisodeExistence() {
        XCTAssertNotNil(episode_1_1)
    }
    
    func testHashableEpisode() {
        XCTAssertNotNil(episode_1_1.hashValue)
    }
    
    func testEpisodeEquality(){
        
        //Comparación
        XCTAssertLessThan(episode_1_1, episode_1_2)
        XCTAssertLessThanOrEqual(episode_1_1, episode_1_1)
        XCTAssertGreaterThan(episode_1_2, episode_1_1)
        XCTAssertGreaterThanOrEqual(episode_1_1, episode_1_1)
    
        //Identidad
        XCTAssertEqual(episode_1_1, episode_1_1)
        
        // Igualdad
        let sameEpisode = episode_1_1
        XCTAssertEqual(sameEpisode, episode_1_1)
        
        // Desigualdad
        XCTAssertNotEqual(episode_1_1, episode_1_2)
        
    }
    
    func testEpisodeDescription(){
        let episodeWithOptional = Episode(numberOf: 101, title: "Winter Is Me", broadcastDateFromString: "2017-08-04", episodeFromSeason: season1)
        let episodeWithoutOptional = Episode(numberOf: 102, title: "Winter Is Me", broadcastDateFromString: "2017-08-04")
        XCTAssertEqual(episodeWithOptional.description, "<1x101> Winter Is Me")
        XCTAssertEqual(episodeWithoutOptional.description, "<NAx102> Winter Is Me")
    }
    
}









