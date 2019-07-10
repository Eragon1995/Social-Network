//
//  SearchedHistoryRModel.swift
//  TokyoLife
//
//  Created by Tran Van Dinh on 8/2/18.
//  Copyright © 2018 EGLIFE. All rights reserved.
//

import Foundation
import RealmSwift

class SearchedHistoryRModel: Object {
    @objc dynamic var id : String?
    @objc dynamic var text : String?
    
    override class func primaryKey() -> String? {
        return "id"
    }
    convenience init(id: String,text: String) {
        self.init()
        self.id = id
        self.text = text
    }
}
