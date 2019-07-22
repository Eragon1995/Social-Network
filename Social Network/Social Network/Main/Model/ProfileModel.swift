//
//  ProfileModel.swift
//  Social Network
//
//  Created by Husky on 7/22/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation

class ProfileModel: Codable {
    let status: Int
    let data: DataClass
    let message: String
    
    init(status: Int, data: DataClass, message: String) {
        self.status = status
        self.data = data
        self.message = message
    }
    class DataClass: Codable {
        let id: Int
        let userName, email, phone, birthday: String
        let fbID, fullName: String
        let star, exp, level: Int
        let createdAt, showName, showPhone, showBirthday: String
        let expNextLevel, postCount, bankAccountNumber: Int
        let bankAccountName, bankAccountBank, bankAccountBranch: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case userName = "user_name"
            case email, phone, birthday
            case fbID = "fb_id"
            case fullName = "full_name"
            case star, exp, level
            case createdAt = "created_at"
            case showName = "show_name"
            case showPhone = "show_phone"
            case showBirthday = "show_birthday"
            case expNextLevel = "exp_next_level"
            case postCount = "post_count"
            case bankAccountNumber = "bank_account_number"
            case bankAccountName = "bank_account_name"
            case bankAccountBank = "bank_account_bank"
            case bankAccountBranch = "bank_account_branch"
        }
        
        init(id: Int, userName: String, email: String, phone: String, birthday: String, fbID: String, fullName: String, star: Int, exp: Int, level: Int, createdAt: String, showName: String, showPhone: String, showBirthday: String, expNextLevel: Int, postCount: Int, bankAccountNumber: Int, bankAccountName: String, bankAccountBank: String, bankAccountBranch: String) {
            self.id = id
            self.userName = userName
            self.email = email
            self.phone = phone
            self.birthday = birthday
            self.fbID = fbID
            self.fullName = fullName
            self.star = star
            self.exp = exp
            self.level = level
            self.createdAt = createdAt
            self.showName = showName
            self.showPhone = showPhone
            self.showBirthday = showBirthday
            self.expNextLevel = expNextLevel
            self.postCount = postCount
            self.bankAccountNumber = bankAccountNumber
            self.bankAccountName = bankAccountName
            self.bankAccountBank = bankAccountBank
            self.bankAccountBranch = bankAccountBranch
        }
    }
}

// MARK: - DataClass

