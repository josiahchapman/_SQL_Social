//
//  MoreCell.swift
//  _SQL_Social
//
//  Created by Josiah Chapman on 5/4/19.
//  Copyright © 2019 Josiah Chapman. All rights reserved.
//

import UIKit

class MoreCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    
    func configureCell(labelText: String) {
        self.cellLabel.text = labelText
    }
}
