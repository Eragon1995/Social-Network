//
//  RandomImage.swift
//  Social Network
//
//  Created by Husky on 7/15/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation

class RandomImage: Codable {
    let status: Int?
    let data: [String]?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
        case message = "message"
    }
    
    init(status: Int?, data: [String]?, message: String?) {
        self.status = status
        self.data = data
        self.message = message
    }
}
