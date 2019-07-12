//
//  HomeVCExtention + TableView.swift
//  Social Network
//
//  Created by Husky on 7/12/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation
import UIKit

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listPostPublic?.data?.list?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
