//
//  CommentCell.swift
//  _SQL_Social
//
//  Created by Josiah Chapman on 5/4/19.
//  Copyright © 2019 Josiah Chapman. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    func configureCell(author: String, body: String) {
        self.authorLabel.text = author
        self.bodyLabel.text = body
    }
}
