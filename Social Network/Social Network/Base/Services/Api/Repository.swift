
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

}
