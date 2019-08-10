//
//  PostPhotoUpdateModel.swift
//  Social Network
//
//  Created by eragon on 8/11/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation
class PostPhotoUpdateModel: Codable {
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
        let list: [List]?
        
        enum CodingKeys: String, CodingKey {
            case list = "list"
        }
        
        init(list: [List]?) {
            self.list = list
        }
    }
    
    // MARK: - List
    class List: Codable {
        let id: Int?
        let path: String?
        let imageWidth: Int?
        let imageHeight: Int?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case path = "path"
            case imageWidth = "image_width"
            case imageHeight = "image_height"
        }
        
        init(id: Int?, path: String?, imageWidth: Int?, imageHeight: Int?) {
            self.id = id
            self.path = path
            self.imageWidth = imageWidth
            self.imageHeight = imageHeight
        }
    }

}

// MARK: - DataClass
