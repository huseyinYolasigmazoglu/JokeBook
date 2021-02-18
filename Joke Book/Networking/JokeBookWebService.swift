//
//  JokeBookWebService.swift
//  Joke Book
//
//  Created by Huseyin Yolasigmazoglu on 16/02/2021.
//

import Foundation


class JokeBookWebService {
    
    func getAllJokes(completion: @escaping ([JokeCategory]) -> ()) {
        
        var jokeCategories = [JokeCategory]()
        var requestCount = 0
        let categoriesCount = JokeCategory.allJokeCategories().count
        
        JokeCategory.allJokeCategories().forEach { (category) in
            
            Service().load(Joke.decodeJokes(category: category)) { jokes in
                
                requestCount += 1
                
                guard let jokes = jokes else {
                    return
                }
                
                let category = JokeCategory(title: category, jokes: jokes)
                
                jokeCategories.append(category)
                
                if requestCount == categoriesCount {
                    
                    DispatchQueue.main.async {
                        completion(jokeCategories)
                    }
                }
                
            }
        }
    }
}
