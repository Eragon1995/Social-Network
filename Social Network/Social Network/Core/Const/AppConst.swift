import UIKit

struct AppConst {
    
    static let SCREEN_WIDTH = UIScreen.main.bounds.width
    static let ratioWithIp6 = AppConst.SCREEN_WIDTH/375.0

//    static let APP_VERSION = "1.0.8"
    
    static let ENABLE_LOG_NETWORK_REQUEST_RESPONSE = true
    
    static var IS_NEED_VERIFY_OTP = true
    
    static let IS_USE_NONE_AUTOLAYOUT = false;
}

struct ApiKeyGoogle {
    static let API_KEY_GOOGLE = "AIzaSyDZMNHYEdmzEnEXeHo3UEZMd9Gv6NnIAZY"
}

struct ApiConst {
    static let BASE_URL = "http://159.89.197.62:9999/api/"
    
    static let STATUS_SUCCESS = 1
    static let STATUS_ERROR = 0
}

struct AppGlobal {
    static var APP_DOMAIN = ""
}

enum LoginType: String {
    case FACEBOOK = "F"
    case ACCOUNT = "N"
    case GOOGLE = "G"
    case ZALO = "Z"
}

struct UserRegisterType {
    static let Normal = "0"
    static let Facebook = "1"
}


