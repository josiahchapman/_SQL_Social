//
//  TitleCell.swift
//  _SQL_Social
//
//  Created by Josiah Chapman on 5/4/19.
//  Copyright © 2019 Josiah Chapman. All rights reserved.
//

import UIKit

class TitleCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var answersLabel: UILabel!
    
    var postID: String?
    var bodyText: String?

    func configureCell(title: String, voteCount: String, answerCount: String, postID: String, bodyText: String) {
        self.titleLabel.text = title
        self.votesLabel.text = "votes: " + voteCount
        self.answersLabel.text = "answers: " + answerCount
        
        self.postID = postID
        self.bodyText = bodyText
    }
}
