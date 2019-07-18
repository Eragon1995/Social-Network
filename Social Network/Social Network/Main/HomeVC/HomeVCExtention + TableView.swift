//
//  HomeVCExtention + TableView.swift
//  Social Network
//
//  Created by Husky on 7/12/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        print("LEU LEU \(self.listPostPublic?.data?.list?.count ?? 0)")
        return self.listPostPublic?.data?.list?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listPostPublic?.data?.list?[section].comments?.count ?? 0 + 1
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
            let section = indexPath.row
            if self.listPostPublic?.data?.list?.count ?? 0 - 1 < section {
                return UITableViewCell()
            }
            if let data = self.listPostPublic?.data?.list?[section] {
                cell.configCell(model: data, section: section)
            }
            return cell
        } else {
            let cellTable = tableView.dequeueReusableCell(withIdentifier: "CellComment")
            var cell: CellComment!
            if cellTable == nil {
                cell = Bundle.main.loadNibNamed("CellComment", owner: self, options: nil)?.first as? CellComment
            } else {
                cell = cellTable as? CellComment
            }
            if self.listPostPublic?.data?.list?.count ?? 0 - 1 < indexPath.section || self.listPostPublic?.data?.list?[indexPath.section].comments?.count ?? 0 < indexPath.row {
                return UITableViewCell()
            }
            if let data = self.listPostPublic?.data?.list?[indexPath.section].comments?[indexPath.row - 1] {
                cell.configCell(model: data, indexPath: indexPath)
            }
            return cell
        }
    }
    func reloadHeader(secsion: Int) {
        let indexSet: IndexSet = [secsion]
        self.tableView.reloadSections(indexSet, with: .automatic)
    }
}
