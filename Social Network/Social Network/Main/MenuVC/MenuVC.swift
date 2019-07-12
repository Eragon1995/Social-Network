//
//  MenuVC.swift
//  Social Network
//
//  Created by Husky on 7/11/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit

class MenuVC: BaseViewController  {

    var arrMenuItem = [MenuModel]()
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgMain: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupDataMenu()
    }
    
    func setupDataMenu() {
        self.arrMenuItem.removeAll()
        self.arrMenuItem.append(MenuModel(imageResource: "", menuName: "Item1", id: MenuModel.MENU_1))
        self.arrMenuItem.append(MenuModel(imageResource: "", menuName: "Item2", id: MenuModel.MENU_2))
        self.arrMenuItem.append(MenuModel(imageResource: "", menuName: "Đăng xuất", id: MenuModel.MENU_3))
        self.tableView.reloadData()
    }
}

extension MenuVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMenuItem.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTable = tableView.dequeueReusableCell(withIdentifier: "CellMenu")
        var cell: CellMenu!
        if cellTable == nil {
            cell = Bundle.main.loadNibNamed("CellMenu", owner: self, options: nil)?.first as? CellMenu
        } else {
            cell = cellTable as? CellMenu
        }
        cell.lblNameMenu.text = self.arrMenuItem[indexPath.row].menuName ?? ""
        cell.imgMain.image = UIImage.init(named: "\(self.arrMenuItem[indexPath.row].imageResource ?? "")")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = self.arrMenuItem[indexPath.row]
        switch menuItem.id {
        case MenuModel.MENU_1:
            print("Seleted \(indexPath.row)")
        case MenuModel.MENU_2:
            print("Selected \(indexPath.row)")
        case MenuModel.MENU_3:
            print("Selected \(indexPath.row)")
        default:
            break
        }
    }
}
