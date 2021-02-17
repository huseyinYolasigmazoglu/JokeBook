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
    
    func categoryAtIndex(_ section: Int) -> String {
        
        return self.jokeCategories[section].title
    }
        
    func jokeQuestionForSectionAtIndex(section: Int,index: Int) -> String {
        return self.jokeCategories[section].jokes[index].setup ?? ""
    }
    
    func jokeForSectionAtIndex(section: Int,index: Int) -> Joke {
        return self.jokeCategories[section].jokes[index] 
    }
}

