//
//  ViewController.swift
//  Joke Book
//
//  Created by Huseyin Yolasigmazoglu on 16/02/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var jokeCategoryListVM: JokeCategoryListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        loadJokes()
        
    }
    
    func loadJokes()  {
        
        JokeBookWebService().getAllJokes { [weak self] jokes in
            
            print(jokes[0].jokes.count)
            print(jokes[0].jokes)
            self?.jokeCategoryListVM = JokeCategoryListViewModel(jokeCategories: jokes)
            
            self?.tableView.reloadData()
        }
    }
    
    
}


extension MainViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return jokeCategoryListVM?.numberOfSections ?? 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 85
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return jokeCategoryListVM?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath) as? JokeQuestionTableViewCell else {
            fatalError("JokeQuestionTableViewCell not found")
        }
        
        cell.jokeQuestion = jokeCategoryListVM?.jokeForSectionAtIndex(index: indexPath.row) ?? ""
        
        return cell
    }
    
    
}




