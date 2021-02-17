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
        return jokeCategories.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.jokeCategories[section].jokes.count
    }
        
    func jokeForSectionAtIndex(section: Int,index: Int) -> String {
        return self.jokeCategories[section].jokes[index].setup ?? ""
    }
    
}
