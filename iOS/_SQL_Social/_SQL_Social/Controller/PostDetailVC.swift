//
//  PostDetailVC.swift
//  _SQL_Social
//
//  Created by Josiah Chapman on 5/4/19.
//  Copyright © 2019 Josiah Chapman. All rights reserved.
//

import UIKit

class PostDetailVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    var postID: String?
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postAuthorName: UILabel!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var postEditAddQuestionButton: UIButton!
    @IBOutlet weak var postAnswerCountLabel: UILabel!
    @IBOutlet weak var postVoteCountLabel: UILabel!
    @IBOutlet weak var postUpVoteButton: UIButton!
    @IBOutlet weak var postDownVoteButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var commentArray = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        commentArray.removeAll()
        
        commentArray.append(Comment(author: "Diontre Pate", body: "What's up, it's lit bro. Nice post!"))
        commentArray.append(Comment(author: "Josiah Chapman", body: "Thank you, my dude. I appreciate the feedback, so I am deciding to leave you a bit of a longer commment here on this  thread."))
        commentArray.append(Comment(author: "Josiah Chapman", body: "Anyways, here's a sort comment."))
        commentArray.append(Comment(author: "Diontre Pate", body: "Yeah bro, I appreciate your appreciation. So, here's a medium-sized comment for ya."))
        commentArray.append(Comment(author: "Josiah Chapman", body: "Sups short comment."))
        
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        postID = QuestionInfoService.instance.postID
        postTitleLabel.text = QuestionInfoService.instance.title
        postAuthorName.text = QuestionInfoService.instance.author
        postTextView.text = QuestionInfoService.instance.body
        
        if QuestionInfoService.instance.isAdd {
            postEditAddQuestionButton.setTitle("Add Question", for: .normal)
        }
        
        postAnswerCountLabel.text = QuestionInfoService.instance.answerCount
        postVoteCountLabel.text = QuestionInfoService.instance.voteCount
        
        if QuestionInfoService.instance.isVotedUp {
            // change button
        }
        
        if QuestionInfoService.instance.isVotedDown {
            // change button
        }
    }
    
    @IBAction func postEditAddButtonPressed(_ sender: Any) {
    }
    
    @IBAction func postUpVoteButtonPressed(_ sender: Any) {
    }
    
    @IBAction func postDownVoteButtonPressed(_ sender: Any) {
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension PostDetailVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return commentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell") as? CommentCell else { return UITableViewCell() }
        let comment = commentArray[indexPath.section]
        
        cell.configureCell(author: comment.author, body: comment.body)
        
        cell.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
}
