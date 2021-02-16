//
//  ViewController.swift
//  Joke Book
//
//  Created by Huseyin Yolasigmazoglu on 16/02/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        loadJokes()
        
    }
    
    func loadJokes()  {
        
        JokeBookWebService().getAllJokes { [weak self] jokes in
            
            print(jokes)
        }
    }
    
    
}


extension MainViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 85
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath) as? JokeQuestionTableViewCell else {
            fatalError("JokeQuestionTableViewCell not found")
        }
        
        cell.jokeQuestion = "XXXXXX YYYYYYYYYYYY ZZZZZZZZZZZZZZZ?"
        
        return cell
    }
    
    
}




