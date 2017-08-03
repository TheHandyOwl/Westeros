//
//  Episode.swift
//  Westeros
//
//  Created by Carlos on 3/8/17.
//  Copyright © 2017 THO. All rights reserved.
//

import Foundation

final class Episode{
    
    let title : String
    let broadcastDate : Date
    
    init(title: String, broadcastDateString2Date: String) {
        
        self.title = title
        
        // No podemos usar las extensiones hasta que no hayamos inicializado
        let tempDate = DateFormatter()
        tempDate.dateFormat = "yyyy-MM-dd"
        
        self.broadcastDate = tempDate.date(from: broadcastDateString2Date)!
        
    }
}

extension Episode : Hashable {
    // public var hashValue: Int { get }
    var hashValue: Int{
        get {
            return title.hashValue
        }
    }
}

extension Episode : Equatable {
    // public static func ==(lhs: Self, rhs: Self) -> Bool
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
            return lhs.title == rhs.title
    }
}










