//
//  HomeVC.swift
//  Social Network
//
//  Created by Husky on 7/11/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit
import SideMenu

class HomeVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerViewTop: NSLayoutConstraint!
    var endScroll = false
    var topHeaderView: CGFloat = 0
    var locationY: CGFloat = 0
    var listPostPublic: PostPublicModel?
    var userId: Int = -1
    var controller: String = ""
    
    @IBAction func touchMenu(_ sender: Any) {
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initSideMenu()
        if self.controller == "user" {
            self.getPostUser()
        } else {
            self.getPostPublic()
        }
    }
    
    func getPostUser() {
        self.showLoading()
        Repository().getProfilePost(userId: self.userId) { [unowned self] (response) in
            self.hideLoading()
            if response.isSuccess() {
                let data = JsonParserManager.getPostUser(jsonString: response.rawData ?? "")
                dump(data)
//                self.listPostPublic = data
            } else {
                self.showAlert(message: response.message)
            }
            self.tableView.reloadData()
        }
        
    }
    
    func getPostPublic() {
        self.showLoading()
        Repository().postPublic { [unowned self] (response) in
            self.hideLoading()
            if response.isSuccess() {
                let data = JsonParserManager.postPublic(jsonString: response.rawData ?? "")
                self.listPostPublic = data
            } else {
                self.showAlert(message: response.message)
            }
            self.tableView.reloadData()
        }
    }
}


