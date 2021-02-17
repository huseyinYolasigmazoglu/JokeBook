//
//  JokeCategoryViewModel.swift
//  Joke Book
//
//  Created by Huseyin Yolasigmazoglu on 17/02/2021.
//

import Foundation


struct JokeCategoryListViewModel {
    
    private(set) var jokeCategories: [JokeCategory]
    
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection() -> Int {
        return self.jokeCategories[0].jokes.count
    }
    
    
    func jokeForSectionAtIndex(index: Int) -> String {
        return self.jokeCategories[0].jokes[index].setup ?? ""
    }
    
}
