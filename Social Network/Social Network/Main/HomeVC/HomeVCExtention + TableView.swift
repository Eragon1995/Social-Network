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
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0, 1:
            return UITableView.automaticDimension
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listPostPublic?.data?.list?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTable = tableView.dequeueReusableCell(withIdentifier: "CellMain")
        var cell: CellMain!
        if cellTable == nil {
            cell = Bundle.main.loadNibNamed("CellMain", owner: self, options: nil)?.first as? CellMain
        } else {
            cell = cellTable as? CellMain
        }
        cell.lblName.text = self.listPostPublic?.data?.list?[indexPath.row].user?.userName
        cell.lblDate.text = self.listPostPublic?.data?.list?[indexPath.row].displayDate
        cell.lblTitle.text = self.listPostPublic?.data?.list?[indexPath.row].content
        if let avatarUrl = self.listPostPublic?.data?.list?[indexPath.row].user?.avatarURL, avatarUrl != "" {
            let url = URL(string: avatarUrl)
            cell.imgAvatar.kf.setImage(with: url)
        } else {
            cell.imgAvatar.image = UIImage(named: "defaulAvt")
        }
        if let imgMainUrl = self.listPostPublic?.data?.list?[indexPath.row].photos?.first?.path, imgMainUrl != "" {
            let url = URL(string: imgMainUrl)
            cell.imgMain.kf.setImage(with: url)
        } else {
            let imageRandom = self.listImageUrl.randomElement() ?? ""
            let url = URL(string: imageRandom)
            cell.imgMain.kf.setImage(with: url)
        }
        return cell
    }
}
