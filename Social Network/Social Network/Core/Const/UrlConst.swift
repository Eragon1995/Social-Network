//
//  UrlConst.swift
//

import Foundation

enum URLConst {
    
    //login
    static let LOGIN_URL = ApiConst.BASE_URL + "login"
    //register
    static let REGISTER_URL = ApiConst.BASE_URL + "register"
    //PostPublic
    static let POST_PUBLIC_URL = ApiConst.BASE_URL + "post/public"
    //RandomImage
    static let RANDOM_IMAGE_URL = ApiConst.BASE_URL + "default/randomImage"
    //UpdateProfile
    static let UPDATE_PROFILE_URL = ApiConst.BASE_URL + "profile/update"
    //Profile
    static let PROFILE_URL = ApiConst.BASE_URL + "profile"
    //UploadAvatar
    static let UPLOAD_AVATAR_URL = ApiConst.BASE_URL + "profile/avatar/upload"
    ///folow user
    static let FOLOW_USER_URL = ApiConst.BASE_URL + "post/list/follow"
}

