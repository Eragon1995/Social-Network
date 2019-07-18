//
//  ChatHistoryVC.swift
//  Social Network
//
//  Created by Husky on 7/18/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit
import Firebase

class ChatHistoryVC: BaseViewController {

    var arrUserChat: Array<UserModel> = Array<UserModel>()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //init
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.setupData()
    }
    
    func setupData() {
        let user = Auth.auth().currentUser
        if let user = user {
            let name = user.displayName
            let uid = user.uid
            let email = user.email
            let photoUrl = user.photoURL
            
            currentUser = UserModel(id: uid, email: email!, fullName: name!, linkAvatar: String(describing: photoUrl!))
            let tableName = ref.child("ListFriend")
            let userId = tableName.child(currentUser.id)
            let user: Dictionary<String, String> = ["email": currentUser.email, "fullName": currentUser.fullName, "linkAvatar": currentUser.linkAvatar]
            userId.setValue(user)
            let url: URL = URL(string: currentUser.linkAvatar)!
            do {
                let data: Data = try Data(contentsOf: url)
                currentUser.avatar = UIImage(data: data)
            }
            catch {}
        } else {
            print("LEU LEU LOI setupData")
        }
        let tableName = ref.child("ListChat").child(currentUser.id)
        tableName.observe(.childAdded) { (snapshot) in
            let postDict = snapshot.value as? [String: AnyObject]
            if postDict != nil {
                let email: String = postDict?["email"] as! String
                let fullName: String = postDict?["fullName"] as! String
                let linkAvatar: String = postDict?["linkAvatar"] as! String
                let user: UserModel = UserModel(id: snapshot.key, email: email, fullName: fullName, linkAvatar: linkAvatar)
                self.arrUserChat.append(user)
                self.tableView.reloadData()
            }
        }
    }
}
extension ChatHistoryVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUserChat.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
