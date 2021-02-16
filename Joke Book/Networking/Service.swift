//
//  Service.swift
//  Joke Book
//
//  Created by Huseyin Yolasigmazoglu on 16/02/2021.
//

import Foundation


struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

class Service {
    
    func load<T>(_ resource: Resource<T>, completion: @escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
            
        }.resume()
        
    }
    
}

