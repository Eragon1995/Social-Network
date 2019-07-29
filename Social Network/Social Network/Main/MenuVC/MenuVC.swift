//
//  MenuVC.swift
//  Social Network
//
//  Created by Husky on 7/11/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit
import Firebase

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
        self.initProfile()
    }
    
    func setupDataMenu() {
        self.arrMenuItem.removeAll()
        self.arrMenuItem.append(MenuModel(imageResource: "ic_profile", menuName: "Chỉnh sửa thông tin", id: MenuModel.MENU_1))
        self.arrMenuItem.append(MenuModel(imageResource: "ic_post", menuName: "Bài viết của bạn", id: MenuModel.MENU_2))
        self.arrMenuItem.append(MenuModel(imageResource: "ic_listFriend", menuName: "Danh sách bạn  ", id: MenuModel.MENU_3))
        self.arrMenuItem.append(MenuModel(imageResource: "ic_logout", menuName: "Tin nhắn", id: MenuModel.MENU_4))
        self.arrMenuItem.append(MenuModel(imageResource: "ic_logout", menuName: "Đăng xuất", id: MenuModel.MENU_5))
        self.tableView.reloadData()
    }
    func initProfile() {
        let fullName = UserDataManager.shared.getFullName()
        let email = UserDataManager.shared.getBirthDay()
        
        self.lblName.text = fullName
        self.lblEmail.text = email
        if let avtUrl = UserDataManager.shared.getLinkAvatar(), avtUrl != "" {
            if let url = URL(string: avtUrl) {
                self.imgMain.kf.setImage(with: url)
            }
        } else {
            self.imgMain.image = UIImage.init(named: "defaultAvt")
        }
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
        cell.selectionStyle = .none
        cell.lblNameMenu.text = self.arrMenuItem[indexPath.row].menuName ?? ""
        cell.imgMain.image = UIImage.init(named: "\(self.arrMenuItem[indexPath.row].imageResource ?? "")")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = self.arrMenuItem[indexPath.row]
        switch menuItem.id {
        case MenuModel.MENU_1:
            let mainSb = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            let vc = mainSb.instantiateViewController(withIdentifier: "ProfileRegisterVC") as! ProfileRegisterVC
            vc.controller = "Edit"
            self.navigationController?.pushViewController(vc, animated: true)
        case MenuModel.MENU_2:
            print("Selected \(indexPath.row)")
        case MenuModel.MENU_3:
            let vc = ListFriendVC.init(nibName: "ListFriendVC", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        case MenuModel.MENU_4:
            let vc = ChatHistoryVC.init(nibName: "ChatHistoryVC", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        case MenuModel.MENU_5:
            let mainSB = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            let vc = mainSB.instantiateViewController(withIdentifier: "AuthenticationVC") as! AuthenticationVC
            UserDataManager.shared.clearUserData()
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
        
    }
}
