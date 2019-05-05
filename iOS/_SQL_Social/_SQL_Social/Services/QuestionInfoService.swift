//
//  QuestionInfoService.swift
//  _SQL_Social
//
//  Created by Josiah Chapman on 5/4/19.
//  Copyright © 2019 Josiah Chapman. All rights reserved.
//

import Foundation

class QuestionInfoService {
    static let instance = QuestionInfoService()
    
    private var _postID: String?
    private var _title: String?
    private var _author: String?
    private var _body: String?
    private var _isAdd: Bool?
    private var _answerCount: String?
    private var _voteCount: String?
    private var _isVotedUp: Bool?
    private var _isVotedDown: Bool?
    
    var postID: String {
        return _postID!
    }
    
    var title: String {
        return _title!
    }
    
    var author: String {
        return _author!
    }
    
    var body: String {
        return _body!
    }
    
    var isAdd: Bool {
        return _isAdd!
    }
    
    var answerCount: String {
        return _answerCount!
    }
    
    var voteCount: String {
        return _voteCount!
    }
    
    var isVotedUp: Bool {
        return _isVotedUp!
    }
    
    var isVotedDown: Bool {
        return _isVotedDown!
    }
    
    func passData(postID: String, title: String, author: String, body: String, isAdd: Bool, answerCount: String, voteCount: String, isVotedUp: Bool, isVotedDown: Bool) {
        self._postID = postID
        self._title = title
        self._author = author
        self._body = body
        self._isAdd = isAdd
        self._answerCount = answerCount
        self._voteCount = voteCount
        self._isVotedUp = isVotedUp
        self._isVotedDown = isVotedDown
    }
}
