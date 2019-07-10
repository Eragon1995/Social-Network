//
//  RegisterModel.swift
//  Social Network
//
//  Created by Husky on 7/10/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation

// MARK: - RegisterModel
struct RegisterModel: Codable {
    let status: Int
    let data: DataClass
    let message: String
}

// MARK: - DataClass
struct DataClass: Codable {
    let userID: Int
    let email, userName, fullName: String
    let level: Int
    let token: String
    let paidUserType, paidPlanPrice01: Int
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case email
        case userName = "user_name"
        case fullName = "full_name"
        case level, token
        case paidUserType = "paid_user_type"
        case paidPlanPrice01 = "paid_plan_price_01"
    }
}
