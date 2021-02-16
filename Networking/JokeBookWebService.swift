//
//  JokeBookWebService.swift
//  Joke Book
//
//  Created by Huseyin Yolasigmazoglu on 16/02/2021.
//

import Foundation


class JokeBookWebService {
    
    func getAllJokes(completion: @escaping ([Joke]) -> ()) {
        
        
        JokeCategory.allJokeCategories().forEach { (category) in
            
            Service().load(Joke.decodeJokes(category: category)) { jokes in
                
                guard let jokes = jokes else {
                    return
                }
                DispatchQueue.main.async {
                    completion(jokes)
                }
            }
        }
    }
}
