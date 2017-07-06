//
//  House.swift
//  Westeros
//
//  Created by Carlos on 6/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit

// MARK: - Classes
// typealias House = String
// typealias Sigil = String
// typealias Character = String
typealias Words = String


final class House{
   
    let name    : String
    let sigil   : Sigil
    let words   : Words
    
    init(name: String, sigil: Sigil, words: Words){
        (self.name, self.sigil, self.words) = (name, sigil, words)
    }
}

final class Sigil{
    let description : String
    let image       : UIImage
    
    init(image: UIImage, description: String) {
        (self.image, self.description) = (image, description)
    }
}
