//
//  Season.swift
//  Westeros
//
//  Created by Carlos on 3/8/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit


// MARK: - Environment

typealias Episodes = Set<Episode>


// MARK: - Season Class

final class Season{
    
    let numberOf : Int
    let numberImage: UIImage
    let name : String
    let releaseDate : Date
    
    // Diccionario con imágenes de números
    // Para mostrar la temporada
    let numberImageDictionary: [Int : UIImage] = [
        0: #imageLiteral(resourceName: "metal-number-0.png"),
        1: #imageLiteral(resourceName: "metal-number-1.png"),
        2: #imageLiteral(resourceName: "metal-number-2.png"),
        3: #imageLiteral(resourceName: "metal-number-3.png"),
        4: #imageLiteral(resourceName: "metal-number-4.png"),
        5: #imageLiteral(resourceName: "metal-number-5.png"),
        6: #imageLiteral(resourceName: "metal-number-6.png"),
        7: #imageLiteral(resourceName: "metal-number-7.png"),
        8: #imageLiteral(resourceName: "metal-number-8.png"),
        9: #imageLiteral(resourceName: "metal-number-9.png")
    ]
    
    // OJO: con el toolchain y el private
    private var _episodes : Episodes
    
    init(numberOf: Int, name: String, releaseDateFromString: String) {
        
        self.numberOf = numberOf
        self.numberImage = numberImageDictionary[numberOf]!
        self.name = name
        
        // Formato personalizado en UIKitExtensions
        self.releaseDate = releaseDateFromString.formatString2DateYYYYMMdd()
        
        _episodes = Episodes()
        
    }

}


// MARK: - Season Extensions

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
    
    func  sortedEpisodes() -> [Episode]{
        return _episodes.sorted()
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








