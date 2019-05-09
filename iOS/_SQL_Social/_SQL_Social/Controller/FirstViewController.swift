//
//  FirstViewController.swift
//  _SQL_Social
//
//  Created by Josiah Chapman on 4/9/19.
//  Copyright © 2019 Josiah Chapman. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var newPostButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var titleArray = [Title]()
    let postURL = "localhost:5000/getAllPosts"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        newPostButton.layer.cornerRadius = 37.5
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        titleArray.removeAll()
        titleArray.append(Title(title: "First Title and I want to see if the label will wrap to a new line or truncate Hmmmm let's see", voteCount: "3", answerCount: "12", postID: "ooo", bodyText: "This is the body text of the FIRST post.", author: "Diontre Pate", isVotedUp: true, isVotedDown: false))
        titleArray.append(Title(title: "Second Title", voteCount: "21", answerCount: "1", postID: "o10", bodyText: "This is the body text of the SECOND post.", author: "Josiah Chapman", isVotedUp: false, isVotedDown: true))
        titleArray.append(Title(title: "Third Title", voteCount: "15", answerCount: "4", postID: "o01", bodyText: "This is the body text of the THIRD post.", author: "Diontre Pate", isVotedUp: false, isVotedDown: false))
        
        tableView.reloadData()
    }
    
    func getJSONFromURL() {
        let url = NSURL(string: postURL)
        
        //fetching the data from the url
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                //printing the json in console
                print(jsonObj!.value(forKey: "title")!)
                
                //getting the avengers tag array from json and converting it to NSArray
                if let heroeArray = jsonObj!.value(forKey: "avengers") as? NSArray {
                    //looping through all the elements
                    for heroe in heroeArray{
                        
                        //converting the element to a dictionary
                        if let heroeDict = heroe as? NSDictionary {
                            
                            //getting the name from the dictionary
                            if let name = heroeDict.value(forKey: "name") {
                                
                                //adding the name to the array
                                self.nameArray.append((name as? String)!)
                            }
                            
                        }
                    }
                }
                
                OperationQueue.main.addOperation({
                    //calling another function after fetching the json
                    //it will show the names to label
                    self.showNames()
                })
            }
        }).resume()
    }
    
    @IBAction func newPostButtonPressed(_ sender: Any) {
        //
    }

}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
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
        let currentTitle = titleArray[indexPath.section]
        // CHECK IF CURRENT AUTHOR IS AUTHOR
        
        QuestionInfoService.instance.passData(postID: currentTitle.postID, title: currentTitle.title, author: currentTitle.author, body: currentTitle.bodyText, isAdd: true, answerCount: currentTitle.answerCount, voteCount: currentTitle.voteCount, isVotedUp: currentTitle.isVotedUp, isVotedDown: currentTitle.isVotedDown)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let postDetailVC = storyBoard.instantiateViewController(withIdentifier: "postDetailVC") as! PostDetailVC
        self.present(postDetailVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
}

