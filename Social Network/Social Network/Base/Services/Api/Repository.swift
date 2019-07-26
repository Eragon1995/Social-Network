
import Foundation
import SwiftyJSON
import RxSwift

class Repository: BaseRepository {
    
    func register(email: String, password: String, userName: String, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.REGISTER_URL)"
        var params = Dictionary<String, Any>.init()
        params["email"] = email
        params["password"] = password
        params["userName"] = userName
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    func login(email: String, password: String, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.LOGIN_URL)"
        var params = Dictionary<String, Any>.init()
        params["email"] = email
        params["password"] = password
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    func postPublic( callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.POST_PUBLIC_URL)"
        let params = Dictionary<String, Any>.init()
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    func defaultImage( callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.RANDOM_IMAGE_URL)"
        let params = Dictionary<String, Any>.init()
        return self.callGetMethod(url: url, parameters: params, onComplete: callBack)
    }
    func updateProfile(token: String, fullName: String, userName: String, phone: String, birhday: String, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.UPDATE_PROFILE_URL)"
        var params = Dictionary<String, Any>.init()
        params["token"] = token
        params["full_name"] = fullName
        params["user_name"] = userName
        params["phone"] = phone
        params["birthday"] = birhday
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    func profile(token: String, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.PROFILE_URL)"
        var params = Dictionary<String, Any>.init()
        params["token"] = token
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
    func uploadAvata(token: String, uploadFile: Data, callBack: @escaping (ApiResponse<BaseResponse>) -> ()) -> () {
        let url = "\(URLConst.UPLOAD_AVATAR_URL)"
        var params = Dictionary<String, Any>.init()
        params["token"] = token
        params["uploadFile"] = uploadFile
        return self.callPostMethod(url: url, parameters: params, onComplete: callBack)
    }
}
