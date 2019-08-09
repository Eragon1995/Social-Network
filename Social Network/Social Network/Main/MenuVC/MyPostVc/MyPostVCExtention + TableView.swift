//
//  MyPostVCExtention + TableView.swift
//  Social Network
//
//  Created by Husky on 8/9/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension MyPostVC: UITableViewDelegate, UITableViewDataSource, CellMainDelegate {
    func showImage(indexPath: IndexPath) {
        var listUrl: [String] = []
        if let listPhoto = self.listPostPublic?.data?[indexPath.row].photos, listPhoto.count != 0 {
            for i in listPhoto {
                if let url = i.path {
                    listUrl.append(url)
                }
            }
            let vc = ShowImageVC.init(nibName: "ShowImageVC", bundle: nil)
            vc.listImage = listUrl
            self.navigationController?.pushViewController(vc, animated: true)
        } else if let listPhoto = self.listPostPublic?.data?[indexPath.row].photos, listPhoto.count == 0 {
            let listUrlRandom = UserDataManager.shared.listImage
            let url = listUrlRandom.randomElement() ?? ""
            listUrl.append(url)
            let vc = ShowImageVC.init(nibName: "ShowImageVC", bundle: nil)
            vc.listImage = listUrl
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func showMore(indexPath: IndexPath) {
        let model = self.listPostPublic?.data?[indexPath.row]
        let vc = ShowCommentVC.init(nibName: "ShowCommentVC", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listPostPublic?.data?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        if let data = self.listPostPublic?.data?[section] {
            cell.configCellMyPost(model: data, section: section, controller: "HomeVC")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
