
import Foundation
import SwiftyJSON
import RxSwift

class Repository: BaseRepository {
    
    func updateDevice(deviceToken: String, userId: String?) -> Observable<ApiResponse<UpdateDeviceTokenResponse>> {
        var url = "\(URLConst.UPDATE_TOKEN_URL)&deviceToken=\(deviceToken)"
        
        if (userId != nil) {
            url = "\(url)&userId=\(userId!)"
        }
        
        return self.callGetMethod(url: url)
    }
    
    func checkOtpFogetPassword(phone: String, text_otp: String, code_otp: String, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.CHECK_OTP_FOGET_PASSWORD_URL)"
        var params = Dictionary<String, Any>.init()
        params["phone"] = phone
        params["text_otp"] = text_otp
        params["code_otp"] = code_otp
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func ratePartner(contract_id: Int, rank_partner: Double, comment_partner: String, content_partner: String, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.RATE_PARTNER_URL)"
        var params = Dictionary<String, Any>.init()
        params["contract_id"] = contract_id
        params["rank_partner"] = rank_partner
        params["comment_partner"] = comment_partner
        params["content_partner"] = content_partner
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func updatePassword(phone: String, password: String, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.UPDATE_PASSWORD_URL)"
        var params = Dictionary<String, Any>.init()
        params["phone"] = phone
        params["password"] = password
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func getOtpFogetPassword(phone: String, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.FOGET_PASSWORD_URL)"
        var params = Dictionary<String, Any>.init()
        params["phone"] = phone
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func getRateComment(partner_id: Int, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.GET_RATE_COMMENT)"
        var params = Dictionary<String, Any>.init()
        params["partner_id"] = partner_id
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func cancelTrip(contractId: Int, phone: String, textOtp: String, codeOtp: String, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.CANCEL_TRIP_URL)"
        var params = Dictionary<String, Any>.init()
        params["contract_id"] = contractId
        params["phone"] = phone
        params["text_otp"] = textOtp
        params["code_otp"] = codeOtp
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func addNoteContracts(contractsId: Int, note_contracts: String, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.ADD_NOTE_COMMENT_URL)"
        var params = Dictionary<String, Any>.init()
        params["contracts_id"] = contractsId
        params["note_contracts"] = note_contracts
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func deleteNoteContracts(id: Int, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.DELETE_NOTE_COMMENT_URL)"
        var params = Dictionary<String, Any>.init()
        params["id"] = id
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func getNoteContracts(contractsId: Int, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.GET_NOTE_CONTRACT_URL)"
        var params = Dictionary<String, Any>.init()
        params["contracts_id"] = contractsId
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func getAllHistory( callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.GET_ALL_HISTORY)"
        let params = Dictionary<String, Any>.init()
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func detailTrip(requestId: Int, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.GET_TRIP_DETAIL)"
        var params = Dictionary<String, Any>.init()
        params["request_id"] = requestId
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func getImgCar(partnerId: Int, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.GET_IMG_CAR_URL)"
        var params = Dictionary<String, Any>.init()
        params["partner_id"] = partnerId
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func getQuotation(quotationId: Int, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.GET_QUOCTATION_URL)"
        var params = Dictionary<String, Any>.init()
        params["quotation_id"] = quotationId
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func acceptQuotation(quotationId: Int, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.ACCEPT_QUOCTATION_URL)"
        var params = Dictionary<String, Any>.init()
        params["quotation_id"] = quotationId
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func detailRequest(request_id: Int, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.DETAIL_REQUEST_URL)"
        var params = Dictionary<String, Any>.init()
        params["request_id"] = request_id
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func cancelRequest( callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.CANCEL_CONTRACT_URL)"
        let params = Dictionary<String, Any>.init()
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func cancelRequestTrip(request_id: Int, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.CANCEL_REQUEST_URL)"
        var params = Dictionary<String, Any>.init()
        params["request_id"] = request_id
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func getListRequest( callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.LIST_REQUEST_URL)"
        let params = Dictionary<String, Any>.init()
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    
    func registerRequest(car_id: Int, service_id: Int, pickup_place: String, province_pickup_id: Int, pickup_time: String, dropdown_place: String, dropdown_time: String, note: String, hire: Int, airport_id: Int, voucher: Int, brand_id: Int, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.REGISTER_REQUEST_URL)"
        var params = Dictionary<String, Any>.init()
        params["car_id"] = car_id
        params["service_id"] = service_id
        params["pickup_place"] = pickup_place
        params["province_pickup_id"] = province_pickup_id
        params["dropdown_place"] = dropdown_place
        params["dropdown_time"] = dropdown_time
        params["note"] = note
        params["hire"] = hire
        params["voucher"] = voucher
        params["airport_id"] = airport_id
        params["brand_id"] = brand_id
        params["pickup_time"] = pickup_time
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func getBrandCar( callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.GET_BRAND_CAR_URL)"
        let params = Dictionary<String, Any>.init()
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func getProfileUser( callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.GET_PROFILE_USER_URL)"
        let params = Dictionary<String, Any>.init()
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func getAllAirPort( callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.GET_ALL_AIRPORT_URL)"
        let params = Dictionary<String, Any>.init()
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func getAllProvince( callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.GET_ALL_PROVINCE_URL)"
        let params = Dictionary<String, Any>.init()
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func getAllCar( callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.GET_ALL_CAR_URL)"
        let params = Dictionary<String, Any>.init()
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func checkProfile( callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.CHECK_PROFILE_URL)"
        let params = Dictionary<String, Any>.init()
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func updateName(name: String, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.UPDATE_NAME_URL)"
        var params = Dictionary<String, Any>.init()
        params["name"] = name
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func checkOTPCode(phone: String,text_otp: String, code_otp: String, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.CHECK_OTP_CODE_URL)"
        var params = Dictionary<String, Any>.init()
        params["phone"] = phone
        params["text_otp"] = text_otp
        params["code_otp"] = code_otp
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func loginFaceBook(login_type: Int,facebook_id: String, phone: String, password: String, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.LOGIN_FB_URL)"
        var params = Dictionary<String, Any>.init()
        params["login_type"] = login_type
        params["facebook_id"] = facebook_id
        params["phone"] = phone
        params["password"] = password
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func verifyFaceBook(facebook_id: String, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.CHECK_FACEBOOK_URL)"
        var params = Dictionary<String, Any>.init()
        params["facebook_id"] = facebook_id
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func verifyPhone(phone: String, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.VERIFY_PHONE_URL)"
        var params = Dictionary<String, Any>.init()
        params["phone"] = phone
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    
    func checkOtp(password: String, phone: String, login_type: Int, facebook_id: String, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.CHECK_OTP_URL)"
        var params = Dictionary<String, Any>.init()
        params["password"] = password
        params["phone"] = phone
        params["login_type"] = login_type
        params["facebook_id"] = facebook_id
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }

}
