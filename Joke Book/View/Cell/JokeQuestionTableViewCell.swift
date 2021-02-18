//
//  JokeQuestionTableViewCell.swift
//  Joke Book
//
//  Created by Huseyin Yolasigmazoglu on 16/02/2021.
//

import UIKit

class JokeQuestionTableViewCell: UITableViewCell {
    
    
    @IBOutlet private weak var jokeQuestionLabel: UILabel!
    
    var jokeQuestion : String  = "" {
        
        didSet {
            
            jokeQuestionLabel.text = jokeQuestion
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
