//
//  Comment.swift
//  _SQL_Social
//
//  Created by Josiah Chapman on 5/4/19.
//  Copyright © 2019 Josiah Chapman. All rights reserved.
//

import Foundation

class Comment {
    private var _author: String
    private var _body: String
    
    var author: String {
        return _author
    }
    
    var body: String {
        return _body
    }
    
    init(author: String, body: String) {
        self._author = author
        self._body = body
    }
}
