//
//  JsonParserManager.swift
//  PickUser
//
//  Created by eragon on 4/25/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation

class JsonParserManager {
    
    //Register
    static func register(jsonString: String) -> RegisterModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(RegisterModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    static func login(jsonString: String) -> LoginModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(LoginModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    static func postPublic(jsonString: String) -> PostPublicModel? {
        if let jsonData = jsonString.data(using: .utf8) {
                let data = try? JSONDecoder().decode(PostPublicModel.self, from: jsonData)
            return data;
        }
    return nil
    }
    static func imageRandom(jsonString: String) -> RandomImage? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(RandomImage.self, from: jsonData)
            return data;
        }
        return nil
    }
    static func updateProfile(jsonString: String) -> UpdateProfileModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(UpdateProfileModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    static func profile(jsonString: String) -> ProfileModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(ProfileModel.self, from: jsonData)
            return data;
        }
        return nil
    }
}
