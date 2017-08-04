//
//  Season.swift
//  Westeros
//
//  Created by Carlos on 3/8/17.
//  Copyright © 2017 THO. All rights reserved.
//

import Foundation

typealias Episodes = Set<Episode>

final class Season{
    
    let numberOf : Int
    let name : String
    let releaseDate : Date
    
    // OJO: con el toolchain y el private
    private var _episodes : Episodes
    
    init(numberOf: Int, name: String, releaseDateString2Date: String) {
        
        self.numberOf = numberOf
        self.name = name
        
        // No podemos usar las extensiones hasta que no hayamos inicializado
        let tempDate = DateFormatter()
        tempDate.dateFormat = "yyyy-MM-dd"
        
        self.releaseDate = tempDate.date(from: releaseDateString2Date)!
        
        _episodes = Episodes()
        
    }

}

extension Season{

    var count : Int{
        return _episodes.count
    }

    func add(episode: Episode){
        
        guard (self.numberOf == episode.episodeFromSeason?.numberOf) else{
            return
        }
        _episodes.insert(episode)
    }
    
    func add(episodes: Episode...){
        for episode in episodes{
            add(episode: episode)
        }
    }

}

extension Season {
    var proxySeasonUppercased: String{
        return name.uppercased()
    }
}

extension Season : Comparable {
    /*
     static func <(lhs: Self, rhs: Self) -> Bool
     static func <=(lhs: Self, rhs: Self) -> Bool
     static func >=(lhs: Self, rhs: Self) -> Bool
     static func >(lhs: Self, rhs: Self) -> Bool
     */
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.numberOf < rhs.numberOf
    }
    
    static func <=(lhs: Season, rhs: Season) -> Bool {
        return lhs.numberOf <= rhs.numberOf
    }
    
    static func >=(lhs: Season, rhs: Season) -> Bool {
        return lhs.numberOf >= rhs.numberOf
    }
    
    static func >(lhs: Season, rhs: Season) -> Bool {
        return lhs.numberOf > rhs.numberOf
    }
    
}

extension Season : Hashable {
    // public var hashValue: Int { get }
    var hashValue: Int{
        get {
            return proxySeasonUppercased.hashValue
        }
    }
}

extension Season : Equatable{
    // public static func ==(lhs: Self, rhs: Self) -> Bool
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.numberOf == rhs.numberOf
    }
}

extension Season : CustomStringConvertible {
    // public var description: String { get }
    var description: String {
        return "<T\(numberOf)> \(name)"
    }
}








