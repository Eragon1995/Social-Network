//
//  CreatePostModel.swift
//  Social Network
//
//  Created by eragon on 8/11/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation

class CreatePostModel: Codable {
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
        let content: String?
        let videoCode: Int?
        let roomType: String?
        let roomID: Int?
        let isPin: Int?
        let isDelete: Int?
        let updatedAt: String?
        let createdAt: String?
        let id: Int?
        
        enum CodingKeys: String, CodingKey {
            case userID = "user_id"
            case content = "content"
            case videoCode = "video_code"
            case roomType = "room_type"
            case roomID = "room_id"
            case isPin = "is_pin"
            case isDelete = "is_delete"
            case updatedAt = "updated_at"
            case createdAt = "created_at"
            case id = "id"
        }
        
        init(userID: Int?, content: String?, videoCode: Int?, roomType: String?, roomID: Int?, isPin: Int?, isDelete: Int?, updatedAt: String?, createdAt: String?, id: Int?) {
            self.userID = userID
            self.content = content
            self.videoCode = videoCode
            self.roomType = roomType
            self.roomID = roomID
            self.isPin = isPin
            self.isDelete = isDelete
            self.updatedAt = updatedAt
            self.createdAt = createdAt
            self.id = id
        }
    }

}

// MARK: - DataClass
