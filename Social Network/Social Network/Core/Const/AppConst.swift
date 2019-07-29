import UIKit

struct AppConst {
    
    static let SCREEN_WIDTH = UIScreen.main.bounds.width
    static let ratioWithIp6 = AppConst.SCREEN_WIDTH/375.0

//    static let APP_VERSION = "1.0.8"
    
    static let ENABLE_LOG_NETWORK_REQUEST_RESPONSE = true
    
    static var IS_NEED_VERIFY_OTP = true
    
    static let IS_USE_NONE_AUTOLAYOUT = false
    
    static let LEADING_TRANILING_VIEW_HEADER_CELL: CGFloat = 10
    static let VELOCITY_END_TOP: CGFloat = -1.5
    static let VELOCITY_END_BOT: CGFloat = 0.5
    static let HEIGHT_HEADER_VIEW_MAX: CGFloat = 150
    static let HEIGHT_HEADER_VIEW_MIN: CGFloat = 0
}

struct ApiConst {
    static let BASE_URL = "http://159.89.197.62:9999/api/"
    
    static let STATUS_SUCCESS = 1
    static let STATUS_ERROR = 0
}

struct AppGlobal {
    static var APP_DOMAIN = ""
}



