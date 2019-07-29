//
//  ShowCommentVC.swift
//  Social Network
//
//  Created by Husky on 7/29/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit

class ShowCommentVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {
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
        dump(model)
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("LEU LEU \(self.model?.comments?.count ?? 0 + 1)")
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
            let section = indexPath.row
            cell.configCell(model: self.model!, section: section)
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
