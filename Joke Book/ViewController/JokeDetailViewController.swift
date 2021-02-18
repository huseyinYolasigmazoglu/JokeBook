//
//  JokeDetailViewController.swift
//  Joke Book
//
//  Created by Huseyin Yolasigmazoglu on 17/02/2021.
//

import UIKit

class JokeDetailViewController: UIViewController {
    
    @IBOutlet private weak var jokeAnswer: UILabel!
    
    private var jokeDetailVM : JokeDetailViewModel!
    var joke:Joke?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure()  {
        
        if let joke = joke {
            
            jokeDetailVM = JokeDetailViewModel(joke)
            jokeAnswer.text = jokeDetailVM.jokeAnswer()
        }
    }
    
    
}
