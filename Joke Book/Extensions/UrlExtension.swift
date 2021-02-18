//
//  UrlExtension.swift
//  Joke Book
//
//  Created by Huseyin Yolasigmazoglu on 16/02/2021.
//

import Foundation


extension URL {
    
    static func urlForAllJokes(for category: String) -> URL {
        return URL(string: "https://official-joke-api.appspot.com/jokes/\(category)/ten")!
    }
    
}

