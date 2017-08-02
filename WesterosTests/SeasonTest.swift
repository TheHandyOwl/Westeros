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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        season1 = Season(name: "Season 1", releaseDateString2Date: "2011-04-17")
        season2 = Season(name: "Season 2", releaseDateString2Date: "2012-04-01")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSeasonExistence() {
        XCTAssertNotNil(season1)
    }
    
}
