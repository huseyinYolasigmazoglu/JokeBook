//
//  ViewController.swift
//  Joke Book
//
//  Created by Huseyin Yolasigmazoglu on 16/02/2021.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        JokeBookWebService().getAllJokes { [weak self] jokes in
            
            print(jokes)
        }
    }


}

