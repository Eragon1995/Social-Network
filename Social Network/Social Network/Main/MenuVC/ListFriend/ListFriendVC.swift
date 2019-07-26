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

class ListFriendVC: BaseViewController {
    
    var listFriend: Array<UserModel> = Array<UserModel>()

    @IBAction func touchBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
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
        let cellTable = tableView.dequeueReusableCell(withIdentifier: "CellListFriend")
        var cell: CellListFriend!
        if cellTable == nil {
            cell = Bundle.main.loadNibNamed("CellListFriend", owner: self, options: nil)?.first as? CellListFriend
        } else {
            cell = cellTable as? CellListFriend
        }
        cell.lblName.text = self.listFriend[indexPath.row].fullName
        let url = self.listFriend[indexPath.row].linkAvatar ?? ""
        if url.count != 0 {
            if let url = URL(string: url) {
                cell.imgAvatar.kf.setImage(with: url)
            }
        } else {
            cell.imgAvatar.image = UIImage.init(named: "defaultAvt")
        }

        return cell
    }
}

