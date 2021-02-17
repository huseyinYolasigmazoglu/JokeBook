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
            //print(jokes[0].jokes)
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
        
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return jokeCategoryListVM?.numberOfRowsInSection(section) ?? 0
    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let name = self.jokeCategoryListVM?.categoryAtIndex(section) ?? ""
        
        let screenRect = UIScreen.main.bounds
        let headerView = UIView(frame: CGRect(x: 15, y: 0, width: screenRect.width, height: 60))
        
        headerView.backgroundColor = UIColor.white
        
        let sectionHeaderLabel = UILabel(frame: headerView.frame)
        sectionHeaderLabel.text = name.uppercased()
        sectionHeaderLabel.textColor = UIColor.black
        sectionHeaderLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 24)
        
        headerView.addSubview(sectionHeaderLabel)
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath) as? JokeQuestionTableViewCell else {
            fatalError("JokeQuestionTableViewCell not found")
        
        }
        
        
        cell.jokeQuestion = jokeCategoryListVM?.jokeForSectionAtIndex(section: indexPath.section, index: indexPath.row) ?? ""
        
       // print(cell.jokeQuestion)
        
        return cell
    }
    
    
}




