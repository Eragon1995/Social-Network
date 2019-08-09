//
//  MyPostVC.swift
//  Social Network
//
//  Created by Husky on 8/9/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit
import SideMenu

class MyPostVC: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerViewTop: NSLayoutConstraint!
    var endScroll = false
    var topHeaderView: CGFloat = 0
    var locationY: CGFloat = 0
    var listPostPublic: MyPostModel?
    var userId: Int = -1
    @IBAction func touchMenu(_ sender: Any) {
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //init tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.initSideMenu()
        self.getPostUser()
    }
    
    func getPostUser() {
        self.showLoading()
        print("Leu Leu \(self.userId)")
        Repository().getProfilePost(userId: self.userId) { [unowned self] (response) in
            self.hideLoading()
            if response.isSuccess() {
                let data = JsonParserManager.getPostUser(jsonString: response.rawData ?? "")
                print("Leu Leu \(data?.data?.count ?? 0)")
                self.listPostPublic = data
            } else {
                self.showAlert(message: response.message)
            }
            self.tableView.reloadData()
        }
    }
}
