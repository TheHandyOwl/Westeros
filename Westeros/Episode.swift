//
//  Episode.swift
//  Westeros
//
//  Created by Carlos on 3/8/17.
//  Copyright © 2017 THO. All rights reserved.
//

import Foundation

final class Episode{
    
    let numberOf : Int
    let title : String
    let broadcastDate : Date
    weak var episodeFromSeason : Season?
    
    init(numberOf: Int, title: String, broadcastDateString2Date: String, episodeFromSeason: Season?) {
        
        self.numberOf = numberOf
        self.title = title
        
        // No podemos usar las extensiones hasta que no hayamos inicializado
        let tempDate = DateFormatter()
        tempDate.dateFormat = "yyyy-MM-dd"
        self.broadcastDate = tempDate.date(from: broadcastDateString2Date)!
        
        self.episodeFromSeason = episodeFromSeason
        
    }
    
    convenience init (numberOf: Int, title: String, broadcastDateString2Date: String) {
        self.init(numberOf: numberOf, title: title, broadcastDateString2Date: broadcastDateString2Date, episodeFromSeason: nil)
    }
    
}

extension Episode {
    var proxyTitle: String{
        return title.uppercased()
    }
}

extension Episode : Comparable {
    /*
    static func <(lhs: Self, rhs: Self) -> Bool
    static func <=(lhs: Self, rhs: Self) -> Bool
    static func >=(lhs: Self, rhs: Self) -> Bool
    static func >(lhs: Self, rhs: Self) -> Bool
    */
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.numberOf < rhs.numberOf
    }
    
    static func <=(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.numberOf <= rhs.numberOf
    }
    
    static func >=(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.numberOf >= rhs.numberOf
    }
    
    static func >(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.numberOf > rhs.numberOf
    }
    
}

extension Episode : Hashable {
    // public var hashValue: Int { get }
    var hashValue: Int{
        get {
            return proxyTitle.hashValue
        }
    }
}

extension Episode : Equatable {
    // public static func ==(lhs: Self, rhs: Self) -> Bool
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
            return lhs.proxyTitle == rhs.proxyTitle
    }
}










