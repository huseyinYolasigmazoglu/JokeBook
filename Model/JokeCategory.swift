//
//  JokeCategory.swift
//  Joke Book
//
//  Created by Huseyin Yolasigmazoglu on 16/02/2021.
//

import Foundation

struct JokeCategory {
    
    let title: String
    let jokes: [Joke]
    
    static func allJokeCategories() -> [String] {
        return ["general","programming","knock-knock"]
    }
}
