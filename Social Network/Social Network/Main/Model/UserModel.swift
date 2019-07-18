//
//  UserModel.swift
//  Social Network
//
//  Created by Husky on 7/18/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation
import UIKit

struct  UserModel {
    let id: String!
    let email: String!
    let fullName: String!
    let linkAvatar: String!
    var avatar: UIImage!
    
    init() {
        id = ""
        email = ""
        fullName = ""
        linkAvatar = ""
        avatar = UIImage(named: "ic_avt")
    }
    
    init(id: String, email: String, fullName: String, linkAvatar: String) {
        self.id = id
        self.email = email
        self.fullName = fullName
        self.linkAvatar = linkAvatar
        self.avatar = UIImage(named: "ic_avt")
    }
}
