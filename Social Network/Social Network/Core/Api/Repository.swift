
import Foundation
import SwiftyJSON
import RxSwift

class Repository: BaseRepository {
    let CHECK_VERSION_URL = ApiConst.BASE_URL + "AppVersion/AppVersion.ashx?type=CheckVersion"
//    func getDetailSupport(id: String) -> Observable<ApiResponse<SupportDetailResponse>> {
//        let url = "\(SUPPORT_DETAIL_URL)&id=\(id)"
//        return self.callGetMethod(url: url)
//    }
//
//    func likeProduce(userId: String, productId: String, status: Int) -> Observable<ApiResponse<ProductDetailResponse>> {
//        ///status 1 = like, 2 = unlike
//
//        var params = Dictionary<String, Any>.init()
//        params["userId"] = userId
//        params["productId"] = productId
//        params["status"] = status
//        return self.callPostMethod(url: LIKE_PRODUCT_URL, parameters: params)
//    }
}
