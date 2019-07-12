//
//  LoginModel.swift
//  Social Network
//
//  Created by Husky on 7/12/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation

class LoginModel: Codable {
    let status: Int?
    let data: DataClass?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
        case message = "message"
    }
    
    init(status: Int?, data: DataClass?, message: String?) {
        self.status = status
        self.data = data
        self.message = message
    }
    class DataClass: Codable {
        let userID: Int?
        let email: String?
        let userName: String?
        let fullName: String?
        let phone: String?
        let avatarURL: String?
        let token: String?
        let birthday: String?
        let level: Int?
        let paidUserType: Int?
        let paidPlanPrice01: Int?
        
        enum CodingKeys: String, CodingKey {
            case userID = "user_id"
            case email = "email"
            case userName = "user_name"
            case fullName = "full_name"
            case phone = "phone"
            case avatarURL = "avatar_url"
            case token = "token"
            case birthday = "birthday"
            case level = "level"
            case paidUserType = "paid_user_type"
            case paidPlanPrice01 = "paid_plan_price_01"
        }
        
        init(userID: Int?, email: String?, userName: String?, fullName: String?, phone: String?, avatarURL: String?, token: String?, birthday: String?, level: Int?, paidUserType: Int?, paidPlanPrice01: Int?) {
            self.userID = userID
            self.email = email
            self.userName = userName
            self.fullName = fullName
            self.phone = phone
            self.avatarURL = avatarURL
            self.token = token
            self.birthday = birthday
            self.level = level
            self.paidUserType = paidUserType
            self.paidPlanPrice01 = paidPlanPrice01
        }
    }

}
