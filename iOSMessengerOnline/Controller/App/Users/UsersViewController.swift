//
//  UsersViewController.swift
//  iOSMessengerOnline
//
//  Created Amanzhol on 02.07.2024.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let service = Service.shared
    var users = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "UserCellTableViewCell", bundle: nil), forCellReuseIdentifier: UserCellTableViewCell.reuceId)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        getUsers()
    }
    
    func getUsers(){
        service.getAllUsers { users in
            self.users = users
            self.tableView.reloadData()
        }
    }
}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCellTableViewCell.reuceId, for: indexPath) as! UserCellTableViewCell
        cell.selectionStyle = .none
        let cellname = users[indexPath.row]
        cell.configCell(cellname)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
