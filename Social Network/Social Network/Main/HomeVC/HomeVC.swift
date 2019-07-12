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

    @IBAction func touchMenu(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension HomeVC: UISideMenuNavigationControllerDelegate {
    func initSideMenu() {
        let menu = MenuVC.init(nibName: "MenuVC", bundle: nil)
    }
}

