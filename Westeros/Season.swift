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
    
    let name : String
    let releaseDate : Date
    
    var _episodes : Episodes
    
    init(name: String, releaseDateString2Date: String) {
        
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
        _episodes.insert(episode)
    }
    
    func add(episodes: Episode...){
        for episode in episodes{
            add(episode: episode)
        }
    }

}

/*
extension Season : Equatable{
    // public static func ==(lhs: Self, rhs: Self) -> Bool
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.name == rhs.name
    }
}
 */









