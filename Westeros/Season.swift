//
//  Season.swift
//  Westeros
//
//  Created by Carlos on 3/8/17.
//  Copyright © 2017 THO. All rights reserved.
//

import Foundation

final class Season{
    
    let name : String
    let releaseDate : Date
    
    init(name: String, releaseDateString2Date: String) {
        
        self.name = name
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        self.releaseDate = formatter.date(from: releaseDateString2Date)!
        
    }
    
}
