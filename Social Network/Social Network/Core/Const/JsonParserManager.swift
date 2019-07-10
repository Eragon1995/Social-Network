//
//  JsonParserManager.swift
//  PickUser
//
//  Created by eragon on 4/25/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import Foundation

class JsonParserManager {
    //VerifyPhoneModel
    
    static func updatePassword(jsonString: String) -> UpdatePasswordModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(UpdatePasswordModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func checkOtpFogetPassword(jsonString: String) -> FacebookModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(FacebookModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func getOtpFogetPassword(jsonString: String) -> VerifyPhoneModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(VerifyPhoneModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func getRateComment(jsonString: String) -> GetReteCommentModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(GetReteCommentModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func addNoteContracts(jsonString: String) -> AddNoteModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(AddNoteModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func deleteNoteContracts(jsonString: String) -> DeleteNoteModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(DeleteNoteModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func getNoteContracts(jsonString: String) -> GetNoteContractsModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(GetNoteContractsModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func getAllHistory(jsonString: String) -> GetAllHistoryModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(GetAllHistoryModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func getCancelRepuest(jsonString: String) -> VerifyPhoneModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(VerifyPhoneModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func getTripDetail(jsonString: String) -> GetTripDetailModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(GetTripDetailModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func getImgByPartner(jsonString: String) -> GetImgByPartnerModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(GetImgByPartnerModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func getQuotation(jsonString: String) -> GetQuotationModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(GetQuotationModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func getDetailRequest(jsonString: String) -> DetailRequestModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(DetailRequestModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func getListRequest(jsonString: String) -> ListRequestModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(ListRequestModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func getBrandCar(jsonString: String) -> GetBrandCarModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(GetBrandCarModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func getProfileUser(jsonString: String) -> GetProfileUserModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(GetProfileUserModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func getAllAirPort(jsonString: String) -> AllAirPortModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(AllAirPortModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func getAllProvince(jsonString: String) -> AllProvinceModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(AllProvinceModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func getAllCar(jsonString: String) -> CarTypeModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(CarTypeModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func checkProfile(jsonString: String) -> CheckProfileModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(CheckProfileModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func updateName(jsonString: String) -> UpdateNameModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(UpdateNameModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func checkOTPCode(jsonString: String) -> CheckOTPModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(CheckOTPModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func loginFaceBook(jsonString: String) -> LoginFaceBookModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(LoginFaceBookModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func verifyFaceBook(jsonString: String) -> FacebookModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(FacebookModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func verifyPhone(jsonString: String) -> VerifyPhoneModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(VerifyPhoneModel.self, from: jsonData)
            return data;
        }
        return nil
    }
    
    static func checkOtp(jsonString: String) -> CheckOtpAndResgisterModel? {
        if let jsonData = jsonString.data(using: .utf8) {
            let data = try? JSONDecoder().decode(CheckOtpAndResgisterModel.self, from: jsonData)
            return data;
        }
        return nil
    }

    
}
