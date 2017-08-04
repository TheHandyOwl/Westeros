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
        
        season1 = Season(name: "Season 1", releaseDateString2Date: "2011-04-17")
        season2 = Season(name: "Season 2", releaseDateString2Date: "2012-04-01")
        
        episode_1_1 = Episode(title: "Winter Is Coming", broadcastDateString2Date: "2011-04-17", episodeFromSeason: season1)
        episode_1_2 = Episode(title: "The Kingsroad", broadcastDateString2Date: "2011-04-18", episodeFromSeason: season1)
        episode_1_3 = Episode(title: "Lord Snow", broadcastDateString2Date: "2011-04-19", episodeFromSeason: season1)
        
        episode_2_1 = Episode(title: "The North Remembers", broadcastDateString2Date: "2012-04-01", episodeFromSeason: season2)
        episode_2_2 = Episode(title: "The Night Lands", broadcastDateString2Date: "2012-04-02", episodeFromSeason: season2)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testEpisodeExistence() {
        XCTAssertNotNil(episode_1_1)
    }
    
}
