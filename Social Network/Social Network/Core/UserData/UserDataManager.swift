
import UIKit

class UserDataManager: NSObject {
    static let KEY_USER_ID = "KEY_USER_ID"
    static let KEY_DEVICE_TOKEN = "KEY_DEVICE_TOKEN"
    static let KEY_FULL_NAME = "KEY_FULL_NAME"
    static let KEY_LINK_AVATAR = "KEY_LINK_AVATAR"
    static let KEY_TOKEN = "KEY_TOKEN"
    static let KEY_PHONE = "KEY_PHONE"
    static let KEY_PASS = "KEY_PASS"
    static let KEY_FACEBOOK = "KEY_FACEBOOK"
    static let KEY_LOGIN_TYPE = "KEY_LOGIN_TYPE"
    static let KEY_HISTORY_LOCATION = "KEY_HISTORY_LOCATION"

    var defaults: UserDefaults?;
    
    static let shared = UserDataManager()
    
    var isShow : Bool = true
    
    var isReview = true
    
    override init() {
        defaults = UserDefaults.standard
    }
    
    //getToken
    func setToken(token: String) {
        defaults?.set(token, forKey: UserDataManager.KEY_TOKEN)
    }
    
    func getToken() -> String? {
        return defaults?.string(forKey: UserDataManager.KEY_TOKEN)
    }
    
    func clearToken() {
        defaults?.set(nil, forKey: UserDataManager.KEY_TOKEN)
    }
    
    // history location
    
    func setHistoryLocation(array: [String]) {
        defaults?.set(array, forKey: UserDataManager.KEY_HISTORY_LOCATION)
    }
    
    func getHistoryLocation() -> Array<String> {
        return defaults?.stringArray(forKey: UserDataManager.KEY_HISTORY_LOCATION) ?? [String]()
    }
    // phone
    func setPhone(phone: String) {
        defaults?.set(phone, forKey: UserDataManager.KEY_PHONE)
    }
    
    func getPhone() -> String? {
        return defaults?.string(forKey: UserDataManager.KEY_PHONE)
    }
    
    //passWord
    func setPass(pass: String) {
        defaults?.set(pass, forKey: UserDataManager.KEY_PASS)
    }
    
    func getPass() -> String? {
        return defaults?.string(forKey: UserDataManager.KEY_PASS)
    }
    
    //facebookId
    func setFaceId(faceId: String) {
        defaults?.set(faceId, forKey: UserDataManager.KEY_FACEBOOK)
    }
    
    func getFaceId() -> String? {
        return defaults?.string(forKey: UserDataManager.KEY_FACEBOOK)
    }
    
    //loginType
    func setLoginType(loginType: Int) {
        defaults?.set(loginType, forKey: UserDataManager.KEY_LOGIN_TYPE)
    }
    
    func getLoginType() -> String? {
        return defaults?.string(forKey: UserDataManager.KEY_LOGIN_TYPE)
    }
    
    // User Id ==============================================
    func setUserId(userId: String) {
        defaults?.set(userId, forKey: UserDataManager.KEY_USER_ID)
    }
    
    func getUserId() -> String? {
        return defaults?.string(forKey: UserDataManager.KEY_USER_ID)
    }
    
    // Device Token ==============================================
    func setDeviceToken(deviceToken: String) {
        defaults?.set(deviceToken, forKey: UserDataManager.KEY_DEVICE_TOKEN)
    }
    
    func getDeviceToken() -> String? {
        return defaults?.string(forKey: UserDataManager.KEY_DEVICE_TOKEN)
    }
    
    // Full Name ==============================================
    func setFullName(fullName: String) {
        defaults?.set(fullName, forKey: UserDataManager.KEY_FULL_NAME)
    }
    
    func getFullName() -> String? {
        return defaults?.string(forKey: UserDataManager.KEY_FULL_NAME)
    }
    
    // Link Avatar ==============================================
    func setLinkAvatar(linkAvartar: String) {
        defaults?.set(linkAvartar, forKey: UserDataManager.KEY_LINK_AVATAR)
    }
    
    func getLinkAvatar() -> String? {
        return defaults?.string(forKey: UserDataManager.KEY_LINK_AVATAR)
    }
    
    func clearUserData() -> Void {
        defaults?.removeObject(forKey: UserDataManager.KEY_USER_ID)
        defaults?.removeObject(forKey: UserDataManager.KEY_FULL_NAME)
        defaults?.removeObject(forKey: UserDataManager.KEY_LINK_AVATAR)
        defaults?.removeObject(forKey: UserDataManager.KEY_LOGIN_TYPE)
        defaults?.removeObject(forKey: UserDataManager.KEY_FACEBOOK)
        defaults?.removeObject(forKey: UserDataManager.KEY_PASS)
        defaults?.removeObject(forKey: UserDataManager.KEY_PHONE)
        defaults?.removeObject(forKey: UserDataManager.KEY_TOKEN)
    }
    
}
