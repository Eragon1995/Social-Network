//
//  MenuModel.swift
//  Social Network
//
//  Created by Husky on 7/11/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation
import UIKit

class MenuModel {
    static let MENU_1 = 0
    static let MENU_2 = 1
    static let MENU_3 = 2
    
    var id: Int?
    var imageResource: String?
    var menuName: String?
    var iSActive: Bool = false
    
    init(imageResource: String, menuName: String, id: Int, isActive: Bool = false) {
        self.imageResource = imageResource
        self.menuName = menuName
        self.id = id
    }
}
