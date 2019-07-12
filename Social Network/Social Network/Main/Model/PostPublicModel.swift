//
//  PostPublicModel.swift
//  Social Network
//
//  Created by Husky on 7/12/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation

class PostPublicModel: Codable {
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
        let total: Int?
        let list: [List]?
        
        enum CodingKeys: String, CodingKey {
            case total = "total"
            case list = "list"
        }
        
        init(total: Int?, list: [List]?) {
            self.total = total
            self.list = list
        }
    }
    
    // MARK: - List
    class List: Codable {
        let id: Int?
        let content: String?
        let userID: Int?
        let displayDate: String?
        let isPin: Int?
        let videoCode: String?
        let totalRate: Int?
        let videoImg: String?
        let mediaType: Int?
        let user: ListUser?
        let photos: [ListPhoto]?
        let comments: [Comment]?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case content = "content"
            case userID = "user_id"
            case displayDate = "display_date"
            case isPin = "is_pin"
            case videoCode = "video_code"
            case totalRate = "totalRate"
            case videoImg = "video_img"
            case mediaType = "media_type"
            case user = "user"
            case photos = "photos"
            case comments = "comments"
        }
        
        init(id: Int?, content: String?, userID: Int?, displayDate: String?, isPin: Int?, videoCode: String?, totalRate: Int?, videoImg: String?, mediaType: Int?, user: ListUser?, photos: [ListPhoto]?, comments: [Comment]?) {
            self.id = id
            self.content = content
            self.userID = userID
            self.displayDate = displayDate
            self.isPin = isPin
            self.videoCode = videoCode
            self.totalRate = totalRate
            self.videoImg = videoImg
            self.mediaType = mediaType
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
        let user: CommentUser?
        let photos: [CommentPhoto]?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case userID = "user_id"
            case postID = "post_id"
            case content = "content"
            case totalRate = "totalRate"
            case user = "user"
            case photos = "photos"
        }
        
        init(id: Int?, userID: Int?, postID: Int?, content: String?, totalRate: Int?, user: CommentUser?, photos: [CommentPhoto]?) {
            self.id = id
            self.userID = userID
            self.postID = postID
            self.content = content
            self.totalRate = totalRate
            self.user = user
            self.photos = photos
        }
    }
    
    // MARK: - CommentPhoto
    class CommentPhoto: Codable {
        let id: Int?
        let commentID: Int?
        let path: String?
        let imageWidth: Int?
        let imageHeight: Int?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case commentID = "comment_id"
            case path = "path"
            case imageWidth = "image_width"
            case imageHeight = "image_height"
        }
        
        init(id: Int?, commentID: Int?, path: String?, imageWidth: Int?, imageHeight: Int?) {
            self.id = id
            self.commentID = commentID
            self.path = path
            self.imageWidth = imageWidth
            self.imageHeight = imageHeight
        }
    }
    
    // MARK: - CommentUser
    class CommentUser: Codable {
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
    
    // MARK: - ListPhoto
    class ListPhoto: Codable {
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
    
    // MARK: - ListUser
    class ListUser: Codable {
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
