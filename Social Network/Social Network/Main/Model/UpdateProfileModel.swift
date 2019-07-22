//
//  UpdateProfileModel.swift
//  Social Network
//
//  Created by Husky on 7/22/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation

class UpdateProfileModel: Codable {
    let status: Int
    let data: [Datum]
    let message: String
    
    init(status: Int, data: [Datum], message: String) {
        self.status = status
        self.data = data
        self.message = message
    }
    class Datum: Codable {
        let id: Int
        let userName, phone, fullName, birthday: String
        let bank: Bank
        
        enum CodingKeys: String, CodingKey {
            case id
            case userName = "user_name"
            case phone
            case fullName = "full_name"
            case birthday, bank
        }
        
        init(id: Int, userName: String, phone: String, fullName: String, birthday: String, bank: Bank) {
            self.id = id
            self.userName = userName
            self.phone = phone
            self.fullName = fullName
            self.birthday = birthday
            self.bank = bank
        }
    }
    class Bank: Codable {
        let id, userID, bankAccountNumber: Int
        let bankAccountName, bankAccountBank, bankAccountBranch, createdAt: String
        let updatedAt: String
        enum CodingKeys: String, CodingKey {
            case id
            case userID = "user_id"
            case bankAccountNumber = "bank_account_number"
            case bankAccountName = "bank_account_name"
            case bankAccountBank = "bank_account_bank"
            case bankAccountBranch = "bank_account_branch"
            case createdAt = "created_at"
            case updatedAt = "updated_at"
        }
        init(id: Int, userID: Int, bankAccountNumber: Int, bankAccountName: String, bankAccountBank: String, bankAccountBranch: String, createdAt: String, updatedAt: String) {
            self.id = id
            self.userID = userID
            self.bankAccountNumber = bankAccountNumber
            self.bankAccountName = bankAccountName
            self.bankAccountBank = bankAccountBank
            self.bankAccountBranch = bankAccountBranch
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }
    }
}
