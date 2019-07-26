
import UIKit

class UserDataManager: NSObject {
    static let KEY_EMAIL = "KEY_USER_ID"
    static let KEY_DEVICE_TOKEN = "KEY_DEVICE_TOKEN"
    static let KEY_FULL_NAME = "KEY_FULL_NAME"
    static let KEY_USER_NAME = "KEY_USER_NAME"
    static let KEY_LINK_AVATAR = "KEY_LINK_AVATAR"
    static let KEY_TOKEN = "KEY_TOKEN"
    static let KEY_PHONE = "KEY_PHONE"
    static let KEY_PASS = "KEY_PASS"
    static let KEY_FACEBOOK = "KEY_FACEBOOK"
    static let KEY_LOGIN_TYPE = "KEY_LOGIN_TYPE"
    static let KEY_BIRTHDAY = "KEY_BIRTHDAY"

    var defaults: UserDefaults?;
    
    static let shared = UserDataManager()
    
    var isShow : Bool = true
    
    var isReview = true
    var listImage: [String] = []
    
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
    
    //setbirthday
    func setBirthDay(day: String) {
        defaults?.set(day, forKey: UserDataManager.KEY_BIRTHDAY)
    }
    
    func getBirthDay() -> String? {
        return defaults?.string(forKey: UserDataManager.KEY_BIRTHDAY)
    }
    
    func clearToken() {
        defaults?.set(nil, forKey: UserDataManager.KEY_TOKEN)
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

    
    // User Id ==============================================
    func setEmail(email: String) {
        defaults?.set(email, forKey: UserDataManager.KEY_EMAIL)
    }
    
    func getEmail() -> String? {
        return defaults?.string(forKey: UserDataManager.KEY_EMAIL)
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
    
    //User name
    func setUserName(userName: String) {
        defaults?.set(userName, forKey: UserDataManager.KEY_USER_NAME)
    }
    
    func getUserName() -> String? {
        return defaults?.string(forKey: UserDataManager.KEY_USER_NAME)
    }
    
    // Link Avatar ==============================================
    func setLinkAvatar(linkAvartar: String) {
        defaults?.set(linkAvartar, forKey: UserDataManager.KEY_LINK_AVATAR)
    }
    
    func getLinkAvatar() -> String? {
        return defaults?.string(forKey: UserDataManager.KEY_LINK_AVATAR)
    }
    
    func clearUserData() -> Void {
        defaults?.removeObject(forKey: UserDataManager.KEY_EMAIL)
        defaults?.removeObject(forKey: UserDataManager.KEY_USER_NAME)
        defaults?.removeObject(forKey: UserDataManager.KEY_BIRTHDAY)
        defaults?.removeObject(forKey: UserDataManager.KEY_FULL_NAME)
        defaults?.removeObject(forKey: UserDataManager.KEY_LINK_AVATAR)
        defaults?.removeObject(forKey: UserDataManager.KEY_TOKEN)
        defaults?.removeObject(forKey: UserDataManager.KEY_PASS)
    }
}
