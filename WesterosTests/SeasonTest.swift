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
    
    // Seasons
    var season1 : Season!
    var season2 : Season!
    
    var episode_1_1 : Episode!
    var episode_1_2 : Episode!
    var episode_1_3 : Episode!
    
    var episode_2_1 : Episode!
    var episode_2_2 : Episode!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        season1 = Season(name: "Season 1", releaseDateString2Date: "2011-04-17")
        season2 = Season(name: "Season 2", releaseDateString2Date: "2012-04-01")
        
        episode_1_1 = Episode(title: "Winter Is Coming", broadcastDateString2Date: "2011-04-17")
        episode_1_2 = Episode(title: "The Kingsroad", broadcastDateString2Date: "2011-04-18")
        episode_1_3 = Episode(title: "Lord Snow", broadcastDateString2Date: "2011-04-19")
        
        episode_2_1 = Episode(title: "The North Remembers", broadcastDateString2Date: "2012-04-01")
        episode_2_2 = Episode(title: "The Night Lands", broadcastDateString2Date: "2012-04-02")

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSeasonExistence() {
        XCTAssertNotNil(season1)
    }
    
    func testAddEpisodes() {
        
        XCTAssertEqual(season1.count, 0)
        XCTAssertEqual(season2.count, 0)
        
        season1.add(episode: episode_1_1)
        XCTAssertEqual(season1.count, 1)
        
        season1.add(episode: episode_1_2)
        XCTAssertEqual(season1.count, 2)
        
        season1.add(episode: episode_1_3)
        XCTAssertEqual(season1.count, 3)
        
        season2.add(episodes: episode_2_1, episode_2_2)
        XCTAssertEqual(season2.count, 2)
    }
    
}
