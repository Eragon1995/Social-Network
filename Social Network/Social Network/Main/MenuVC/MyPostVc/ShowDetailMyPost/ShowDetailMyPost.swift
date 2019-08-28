//
//  ShowDetailMyPost.swift
//  Social Network
//
//  Created by eragon on 8/10/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit

class ShowDetailMyPost: BaseViewController,CellMainDelegate, UITableViewDelegate, UITableViewDataSource  {

    var model: MyPostModel.Datum?
    var start: Int = 1
    @IBOutlet weak var tableView: UITableView!
    @IBAction func touchBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        self.tabBarController?.tabBar.isHidden = true
        self.tableView.reloadData()
    }
    func showPost(indexPath: IndexPath) {
    }
    func commentPost(indexPath: IndexPath) {
        let mainSb = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let vc = mainSb.instantiateViewController(withIdentifier: "PostNewVC") as! PostNewVC
        vc.controller = "Comment"
        vc.postId = model?.comments?[indexPath.row].postID ?? 0
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func showImage(indexPath: IndexPath) {
        var listUrl: [String] = []
        if let listPhoto = self.model?.photos, listPhoto.count != 0 {
            for i in listPhoto {
                if let url = i.path {
                    listUrl.append(url)
                }
            }
            let vc = ShowImageVC.init(nibName: "ShowImageVC", bundle: nil)
            vc.listImage = listUrl
            self.navigationController?.pushViewController(vc, animated: true)
        } else if let listPhoto = self.model?.photos, listPhoto.count == 0 {
            let listUrlRandom = UserDataManager.shared.listImage
            let url = listUrlRandom.randomElement() ?? ""
            listUrl.append(url)
            let vc = ShowImageVC.init(nibName: "ShowImageVC", bundle: nil)
            vc.listImage = listUrl
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func donatePost(postId: Int) {
        self.showLoading()
        let token = UserDataManager.shared.getToken() ?? ""
        Repository().donatePost(token: token, star: self.start, postId: postId) { (response) in
            self.hideLoading()
            if response.isSuccess() {
                self.showAlert(message: "Yeu thich thanh cong")
            } else {
                self.showAlert(message: response.message)
            }
        }
    }
    func showMore(indexPath: IndexPath) {
    }
    func donatePost(indexPath: IndexPath) {
        let postId = model?.id ?? 0
        self.donatePost(postId: postId)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.model?.comments?.count ?? 0 + 1
        if count != 0 {
            return self.model?.comments?.count ?? 0 + 1
        } else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cellTable = tableView.dequeueReusableCell(withIdentifier: "CellMain")
            var cell: CellMain!
            if cellTable == nil {
                cell = Bundle.main.loadNibNamed("CellMain", owner: self, options: nil)?.first as? CellMain
            } else {
                cell = cellTable as? CellMain
            }
            cell.selectionStyle = .none
            cell.delegate = self
            cell.indexPath = indexPath
            let section = indexPath.row
            cell.configCellMyPost(model: self.model!, section: section, controller: "ShowCommentVC")
            return cell
        } else {
            let cellTable = tableView.dequeueReusableCell(withIdentifier: "CellComment")
            var cell: CellComment!
            if cellTable == nil {
                cell = Bundle.main.loadNibNamed("CellComment", owner: self, options: nil)?.first as? CellComment
            } else {
                cell = cellTable as? CellComment
            }
            cell.selectionStyle = .none
            let data = self.model?.comments?[indexPath.row]
            cell.configCellMyPost(model: data!, indexPath: indexPath)
            return cell
        }
    }
}
