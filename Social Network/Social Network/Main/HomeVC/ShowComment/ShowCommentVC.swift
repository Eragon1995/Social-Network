//
//  ShowCommentVC.swift
//  Social Network
//
//  Created by Husky on 7/29/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit

class ShowCommentVC: BaseViewController, UITableViewDelegate, UITableViewDataSource, CellMainDelegate {
    var model: PostPublicModel.List?

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
    func showMore(indexPath: IndexPath) {
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
            cell.configCell(model: self.model!, section: section, controller: "ShowCommentVC")
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
            cell.configCell(model: data!, indexPath: indexPath)
            return cell
        }
    }
}
