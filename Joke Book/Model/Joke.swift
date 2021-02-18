//
//  Joke.swift
//  Joke Book
//
//  Created by Huseyin Yolasigmazoglu on 16/02/2021.
//

import Foundation

struct Joke : Codable {
    
    let id : Int?
    let type : String?
    let setup : String?
    let punchline : String?
}


extension Joke {
    
    static func decodeJokes(category:String) -> Resource<[Joke]> {
        
        return Resource<[Joke]>(url : URL.urlForAllJokes(for: category), parse : { data in
            return try! JSONDecoder().decode([Joke].self, from: data)
        } )
    }
}

