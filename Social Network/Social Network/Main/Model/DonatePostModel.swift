//
//  DonatePostModel.swift
//  Social Network
//
//  Created by eragon on 8/10/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation

class DonatePostModel: Codable {
    let status: Int?
    let data: String?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
        case message = "message"
    }
    init(status: Int?, data: String?, message: String?) {
        self.status = status
        self.data = data
        self.message = message
    }
}
