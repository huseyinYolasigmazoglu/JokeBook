//
//  JokeDetailViewModel.swift
//  Joke Book
//
//  Created by Huseyin Yolasigmazoglu on 17/02/2021.
//

import Foundation

struct JokeDetailViewModel {
    
    let joke : Joke
    
    init(_ joke: Joke) {
        self.joke = joke
    }
    
    func jokeQuesion() -> String {
        return joke.setup ?? ""
    }
    
    func jokeAnswer() -> String {
        return joke.punchline  ?? ""
    }
}
