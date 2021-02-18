//
//  ViewController.swift
//  Joke Book
//
//  Created by Huseyin Yolasigmazoglu on 16/02/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var jokeCategoryListVM: JokeCategoryListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadJokes()
        
    }
    
    func loadJokes()  {
        
        JokeBookWebService().getAllJokes { [weak self] jokes in
            
            self?.jokeCategoryListVM = JokeCategoryListViewModel(jokeCategories: jokes)
            
            self?.activityIndicator.stopAnimating()
            
            self?.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier {
            
            if identifier == Constants.gotoPunchlineSegue {
                
                if let destinationViewController = segue.destination as? JokeDetailViewController {
                    
                    if let index = sender as? IndexPath {
                        
                        destinationViewController.joke = jokeCategoryListVM?.jokeForSectionAtIndex(section: index.section, index: index.row)
                    }
                }
            }
        }
        
    }
    
}


extension MainViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return jokeCategoryListVM?.numberOfSections ?? 1
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return jokeCategoryListVM?.containerHeight() ?? 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return jokeCategoryListVM?.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let name = self.jokeCategoryListVM?.categoryAtIndex(section) ?? ""
        
        return UIView.viewForSectionHeader(name)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.jokeCell, for: indexPath) as? JokeQuestionTableViewCell else {
            fatalError("JokeQuestionTableViewCell not found")
            
        }
        
        cell.jokeQuestion = jokeCategoryListVM?.jokeQuestionForSectionAtIndex(section: indexPath.section, index: indexPath.row) ?? ""
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: Constants.gotoPunchlineSegue, sender: indexPath)
    }
    
}




