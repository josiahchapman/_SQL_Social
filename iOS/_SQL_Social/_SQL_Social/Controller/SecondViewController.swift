//
//  SecondViewController.swift
//  _SQL_Social
//
//  Created by Josiah Chapman on 4/9/19.
//  Copyright © 2019 Josiah Chapman. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var newPostButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var titleArray = [Title]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        newPostButton.layer.cornerRadius = 37.5
    }
    
    override func viewDidAppear(_ animated: Bool) {
        titleArray.removeAll()
        titleArray.append(Title(title: "My first question", voteCount: "3", answerCount: "12", postID: "ooo", bodyText: "This is the body text of the FIRST post.", author: "Josiah Chapman", isVotedUp: false, isVotedDown: false))
        titleArray.append(Title(title: "This is my second question", voteCount: "21", answerCount: "1", postID: "o10", bodyText: "This is the body text of the SECOND post.", author: "Josiah Chapman", isVotedUp: false, isVotedDown: false))
        titleArray.append(Title(title: "This is my third question", voteCount: "15", answerCount: "4", postID: "o01", bodyText: "This is the body text of the THIRD post.", author: "Josiah Chapman",  isVotedUp: false, isVotedDown: false))
        
        tableView.reloadData()
    }
    
    @IBAction func newPostButtonPressed(_ sender: Any) {
        //
    }
    
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell") as? TitleCell else { return UITableViewCell() }
        let currentTitle = titleArray[indexPath.section]
        
        cell.configureCell(title: currentTitle.title, voteCount: currentTitle.voteCount, answerCount: currentTitle.answerCount, postID: currentTitle.postID, bodyText: currentTitle.bodyText)
        
        cell.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
}
