//
//  UIKitExtensionTest.swift
//  Westeros
//
//  Created by Carlos on 9/8/17.
//  Copyright © 2017 THO. All rights reserved.
//

import XCTest
@testable import Westeros

class UIKitExtensionTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Date 2 String
    func testData2StringConversion() {
        
        let someStringDate = "2017-01-08"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY/MM/dd"
        let someDate = formatter.date(from: someStringDate)
        let checkThisStringDate = formatter.string(from: someDate!)
        // YES: someStringDate == checkThisStringDate
        
        XCTAssertEqual(checkThisStringDate, someDate?.formatDate2StringYYYYMMdd())
    }
    
    // String 2 Date
    func testString2DataConversion() {
        
        let someStringDate = "2017-01-08"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY/MM/dd"
        let checkThisDate = formatter.date(from: someStringDate)
        
        XCTAssertEqual(checkThisDate, someStringDate.formatString2DateYYYYMMdd())
    }
    
}
