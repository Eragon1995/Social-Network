//
//  MyPostModel.swift
//  Social Network
//
//  Created by eragon on 8/8/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation

class MyPostModel: Codable {
    let status: Int?
    let data: [Datum]?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
        case message = "message"
    }
    
    init(status: Int?, data: [Datum]?, message: String?) {
        self.status = status
        self.data = data
        self.message = message
    }
    class Datum: Codable {
        let id: Int?
        let content: String?
        let userID: Int?
        let displayDate: String?
        let totalRate: Int?
        let user: User?
        let photos: [Photo]?
        let comments: [Comment]?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case content = "content"
            case userID = "user_id"
            case displayDate = "display_date"
            case totalRate = "totalRate"
            case user = "user"
            case photos = "photos"
            case comments = "comments"
        }
        
        init(id: Int?, content: String?, userID: Int?, displayDate: String?, totalRate: Int?, user: User?, photos: [Photo]?, comments: [Comment]?) {
            self.id = id
            self.content = content
            self.userID = userID
            self.displayDate = displayDate
            self.totalRate = totalRate
            self.user = user
            self.photos = photos
            self.comments = comments
        }
    }
    // MARK: - Comment
    class Comment: Codable {
        let id: Int?
        let userID: Int?
        let postID: Int?
        let content: String?
        let totalRate: Int?
        let user: User?
        let photos: [Photo]?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case userID = "user_id"
            case postID = "post_id"
            case content = "content"
            case totalRate = "totalRate"
            case user = "user"
            case photos = "photos"
        }
        
        init(id: Int?, userID: Int?, postID: Int?, content: String?, totalRate: Int?, user: User?, photos: [Photo]?) {
            self.id = id
            self.userID = userID
            self.postID = postID
            self.content = content
            self.totalRate = totalRate
            self.user = user
            self.photos = photos
        }
    }
    
    // MARK: - Photo
    class Photo: Codable {
        let id: Int?
        let postID: Int?
        let path: String?
        let imageWidth: Int?
        let imageHeight: Int?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case postID = "post_id"
            case path = "path"
            case imageWidth = "image_width"
            case imageHeight = "image_height"
        }
        
        init(id: Int?, postID: Int?, path: String?, imageWidth: Int?, imageHeight: Int?) {
            self.id = id
            self.postID = postID
            self.path = path
            self.imageWidth = imageWidth
            self.imageHeight = imageHeight
        }
    }
    
    // MARK: - User
    class User: Codable {
        let id: Int?
        let userName: String?
        let avatarURL: String?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case userName = "user_name"
            case avatarURL = "avatar_url"
        }
        
        init(id: Int?, userName: String?, avatarURL: String?) {
            self.id = id
            self.userName = userName
            self.avatarURL = avatarURL
        }
    }
}

// MARK: - Datum
