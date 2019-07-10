//
//  UrlConst.swift
//

import Foundation

enum URLConst {
    
    //verify-phone
    static let VERIFY_PHONE_URL = ApiConst.BASE_URL + "user/register/verify-phone"
    
    //checkOtp
    static let CHECK_OTP_URL = ApiConst.BASE_URL + "customer/register-customer"
    
    //uploadAnh
    static let UPLOAD_AVATAR_URL = ApiConst.BASE_URL + "customer/profile/upload-avatar-user"
    
    //check Facebook
    static let CHECK_FACEBOOK_URL = ApiConst.BASE_URL + "user/register/verify-facebook"
    
    //LoginFaceBook
    static let LOGIN_FB_URL = ApiConst.BASE_URL + "customer/login"
    
    //checkOTP
    static let CHECK_OTP_CODE_URL = ApiConst.BASE_URL + "customer/check-otp-customer"
    
    //updateName
    static let UPDATE_NAME_URL = ApiConst.BASE_URL + "customer/profile/upload-avatar-user"
    
    //checkProfile
    static let CHECK_PROFILE_URL = ApiConst.BASE_URL + "customer/check-profile-customer"
    
    //get all car
    static let GET_ALL_CAR_URL = ApiConst.BASE_URL + "public/get-all-car"
    
    //get all province
    static let GET_ALL_PROVINCE_URL = ApiConst.BASE_URL + "public/get-all-province"
    
    //get all AirPort
    static let GET_ALL_AIRPORT_URL = ApiConst.BASE_URL + "customer/register/get-all-airport"
    
    //get profile user
    static let GET_PROFILE_USER_URL = ApiConst.BASE_URL + "customer/profile/get-profile-user"
    
    //get Brand Car
    static let GET_BRAND_CAR_URL = ApiConst.BASE_URL + "public/get-brand-car"
    
    //send Register Request
    static let REGISTER_REQUEST_URL = ApiConst.BASE_URL + "customer/register/requests"
    
    //listRequest
    static let LIST_REQUEST_URL = ApiConst.BASE_URL + "customer/request/get-all-requests"
    
    //delete contract
    static let CANCEL_CONTRACT_URL = ApiConst.BASE_URL + "customer/request-cancel-contract"
    
    //cancel request
    static let CANCEL_REQUEST_URL = ApiConst.BASE_URL + "customer/request/cancel-request"
    
    //detail Request
    static let DETAIL_REQUEST_URL = ApiConst.BASE_URL + "customer/request/get-request"
    
    //accept quotation
    static let ACCEPT_QUOCTATION_URL = ApiConst.BASE_URL + "customer/request/accept-quotation"
    
    //get quotation
    static let GET_QUOCTATION_URL = ApiConst.BASE_URL + "customer/request/get-quotation"
    
    //get imgCar
    static let  GET_IMG_CAR_URL = ApiConst.BASE_URL + "customer/get-image-by-partner"
    
    //get rate comment
    static let GET_RATE_COMMENT = ApiConst.BASE_URL + "customer/profile/get-rate-comment"
    
    static let UPDATE_TOKEN_URL = ApiConst.BASE_URL + "device/device.ashx?type=registerDevice&os=2"
    
    // rate partner
    static let RATE_PARTNER_URL = ApiConst.BASE_URL + "customer/profile/rate-partner"
    
    //get trip detail
    static let GET_TRIP_DETAIL = ApiConst.BASE_URL + "customer/request/get-trip-detail-customer-by-request-id"
    
    //get all history
    static let GET_ALL_HISTORY = ApiConst.BASE_URL + "customer/get-all-history-new"
    
    //get note contract
    static let GET_NOTE_CONTRACT_URL = ApiConst.BASE_URL + "customer/get-note-contracts"
    
    // delete note comment
    static let DELETE_NOTE_COMMENT_URL = ApiConst.BASE_URL + "customer/delete-note-contracts"
    
    // add note comment
    static let ADD_NOTE_COMMENT_URL = ApiConst.BASE_URL + "customer/update-note-contracts"
    
    //cancel trip
    static let CANCEL_TRIP_URL = ApiConst.BASE_URL + "customer/cancel-trip"
    
    //opt fogetPassword
    static let FOGET_PASSWORD_URL = ApiConst.BASE_URL + "customer/get-forget-password"
    
    //checkOtp fogetPassword
    static let CHECK_OTP_FOGET_PASSWORD_URL = ApiConst.BASE_URL + "customer/check-forget-password-otp"
    
    //update Password
    static let UPDATE_PASSWORD_URL = ApiConst.BASE_URL + "customer/update-password"
}

