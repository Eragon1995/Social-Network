import UIKit

struct AppConst {
    
    static let SCREEN_WIDTH = UIScreen.main.bounds.width
    static let ratioWithIp6 = AppConst.SCREEN_WIDTH/375.0
    
    static let APP_VERSION = "1.0.7"
    
    static let ENABLE_LOG_NETWORK_REQUEST_RESPONSE = true
    static let HASH_KEY_MD5 = "tokyolife2018"
    
    static let APP_STORE_URL = "https://itunes.apple.com/us/app/tokyolife/id1255809177?ls=1&mt=8"
    
    static let IS_NEED_VERIFY_OTP = false
    
    static let IS_USE_NONE_AUTOLAYOUT = false;
}

struct ApiConst {
//    static let BASE_URL = "http://210.245.26.88:8080/api/"
    static let BASE_URL = "http://113.176.4.8:2002/api/"
//    static let BASE_URL = "http://api.tokyolife.vn/api/"
    
    static let STATUS_SUCCESS = 1
    static let STATUS_ERROR = 0
}

struct AppGlobal {
    static var APP_DOMAIN = ""
}

struct MenuFunctionType {
    static let HOME = 1
    static let SUPPORT = 3
    static let LIKE = 6
    static let GAME = 7
}

struct TrendingViewTypeConst {
    static let Category1 = 1
    static let Category2 = 2
    static let Product = 3
    static let Header = 4
    static let BannerVideo = 5
    
    static let VideoType6 = 6
    static let VideoType7 = 7
}

struct TrendingPageTypeConst {
    static let Product = 1
    static let News = 2
    static let Game = 3
}

struct NotifyTypeConst {
    static let ALL_TYPE = 0
    static let SALE_HOT_TYPE = 1
    static let ME_TYPE = 2
    static let EVENT_TYPE = 3
}

enum NotificationType: Int {
    case NONE = 0
    case NEWS = 1
    case PRODUCT = 2
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


