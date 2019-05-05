//
//  MoreContentVC.swift
//  _SQL_Social
//
//  Created by Josiah Chapman on 5/4/19.
//  Copyright © 2019 Josiah Chapman. All rights reserved.
//

import UIKit

class MoreContentVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tableViewData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        tableViewData.removeAll()
        tableViewData.append("Profile Settings")
        tableViewData.append("Logout")
        
        tableView.reloadData()
    }
}

extension MoreContentVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "moreCell") as? MoreCell else { return UITableViewCell() }
        let currentLabelText = tableViewData[indexPath.section]
        
        cell.configureCell(labelText: currentLabelText)
        
        cell.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if indexPath.section == 0 {
            // profile settings
            let profileSettingsVC = storyboard.instantiateViewController(withIdentifier: "profileSettingsVC") as! ProfileSettingsVC
            self.present(profileSettingsVC, animated: true, completion: nil)
        } else {
            // log out
            let loginVC = storyboard.instantiateViewController(withIdentifier: "loginVC") as! LoginVC
            self.present(loginVC, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
}
