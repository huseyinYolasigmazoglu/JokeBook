//
//  JokeBookWebService.swift
//  Joke Book
//
//  Created by Huseyin Yolasigmazoglu on 16/02/2021.
//

import Foundation


class JokeBookWebService {
    
    func getAllJokes(completion: @escaping ([Joke]) -> ()) {
    
        Service().load(Joke.decodeJokes()) { (jokes) in
            
            print(jokes)
            //completion(jokes)
        }
    }
}
