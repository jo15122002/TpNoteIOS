//
//  UserListViewController.swift
//  TpFinalSwift
//
//  Created by digital on 13/12/2022.
//

import UIKit

class UserListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let userListDownloader = UserJsonDownloader()
    var userList = Users() {
        didSet{
            self.userListTableView.reloadData()
        }
    }
    var selectedUserId = 1
    
    
    @IBOutlet weak var userListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userListTableView.delegate = self
        self.userListTableView.dataSource = self
        self.userListTableView.rowHeight = 100
        
        self.userListDownloader.downloadUsers(urlString: "http://jsonplaceholder.typicode.com/users") {
            self.userList = self.userListDownloader.users
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var userCell = userListTableView.dequeueReusableCell(withIdentifier: "userViewCell", for: indexPath) as! UserViewCell
        
        userCell.nameLabel?.text = userList[indexPath.row].name
        userCell.surnameLabel?.text = userList[indexPath.row].username
        userCell.companyLabel?.text = userList[indexPath.row].company.name
        
        
        return userCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedUserId = indexPath.row
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier{
            if id == "toAlbumPhotos"{
                if let dest = segue.destination as? AlbumPhotosViewController{
                    dest.albumId = self.selectedUserId
                }
            }
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
