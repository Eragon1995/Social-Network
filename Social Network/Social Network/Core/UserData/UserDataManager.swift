
import UIKit

class UserDataManager: NSObject {
    static let KEY_USER_ID = "KEY_USER_ID"
    static let KEY_DEVICE_TOKEN = "KEY_DEVICE_TOKEN"
    static let KEY_FULL_NAME = "KEY_FULL_NAME"
    static let KEY_LINK_AVATAR = "KEY_LINK_AVATAR"

    var defaults: UserDefaults?;
    
    static let shared = UserDataManager()
    
    var loginBanner = ""
    var popupHomeUrl = ""
    var showPopUpWithGiftIsFirstTime = false
    
    override init() {
        defaults = UserDefaults.standard
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
    }
    
}
