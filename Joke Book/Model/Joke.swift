//
//  Joke.swift
//  Joke Book
//
//  Created by Huseyin Yolasigmazoglu on 16/02/2021.
//

import Foundation

struct Joke : Codable {
    
    var id : Int
    var type : String
    var setup : String
    var punchline : String    
}


