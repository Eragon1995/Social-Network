//
//  ListFriendVC.swift
//  Social Network
//
//  Created by Husky on 7/18/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit
import Firebase

var visitor: UserModel!
let ref = Database.database().reference()
var currentUser: UserModel!

class ListFriendVC: BaseViewController {
    
    var listFriend: Array<UserModel> = Array<UserModel>()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //init table
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.getListFriend()
    }
    
    func getListFriend() {
        let tableName = ref.child("ListFriend")
        tableName.observe(.childAdded, with: { (snapshot) in
            let postDict = snapshot.value as? [String: AnyObject]
            if(postDict != nil)
            {
                let email:String = (postDict?["email"])! as! String
                let fullName:String = (postDict?["fullName"])! as! String
                let linkAvatar:String = (postDict?["linkAvatar"])! as! String
                
                let user:UserModel = UserModel(id: snapshot.key, email: email, fullName: fullName, linkAvatar: linkAvatar)
                if(user.id != currentUser.id)
                {
                    self.listFriend.append(user)
                }
                self.tableView.reloadData()
            }
        })
    }
}
extension ListFriendVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listFriend.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

