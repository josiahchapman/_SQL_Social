//
//  Title.swift
//  _SQL_Social
//
//  Created by Josiah Chapman on 5/4/19.
//  Copyright © 2019 Josiah Chapman. All rights reserved.
//

import Foundation

class Title {
    private var _title: String
    private var _author: String
    private var _voteCount: String
    private var _answerCount: String
    private var _postID: String
    private var _bodyText: String
    private var _isVotedUp: Bool
    private var _isVotedDown: Bool
    
    var title: String {
        return _title
    }
    
    var voteCount: String {
        return _voteCount
    }
    
    var answerCount: String {
        return _answerCount
    }
    
    var postID: String {
        return _postID
    }
    
    var bodyText: String {
        return _bodyText
    }
    
    var author: String {
        return _author
    }
    
    var isVotedUp: Bool {
        return _isVotedUp
    }
    
    var isVotedDown: Bool {
        return _isVotedDown
    }
    
    init(title: String, voteCount: String, answerCount: String, postID: String, bodyText: String, author: String, isVotedUp: Bool, isVotedDown: Bool) {
        self._title = title
        self._voteCount = voteCount
        self._answerCount = answerCount
        self._postID = postID
        self._bodyText = bodyText
        self._author = author
        self._isVotedUp = isVotedUp
        self._isVotedDown = isVotedDown
    }
}
