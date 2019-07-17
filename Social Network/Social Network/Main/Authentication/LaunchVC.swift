//
//  LaunchVC.swift
//  Social Network
//
//  Created by Husky on 7/15/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit

class LaunchVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.autoLogin()
        self.getListImageRandom()
    }
    
    func getListImageRandom() {
        self.showLoading()
        Repository().defaultImage { (response) in
            self.hideLoading()
            if response.isSuccess() {
                let data = JsonParserManager.imageRandom(jsonString: response.rawData ?? "")
                UserDataManager.shared.listImage = data?.data ?? [String]()
            } else {
                self.showAlert(message: response.message)
            }
        }
    }
    func autoLogin() {
        if let token = UserDataManager.shared.getToken(), token != "" {
            self.login()
        } else {
            let mainSB = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            let vc = mainSB.instantiateViewController(withIdentifier: "AuthenticationVC") as! AuthenticationVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func login() {
        self.showLoading()
        let email = UserDataManager.shared.getEmail() ?? ""
        let pass = UserDataManager.shared.getPass() ?? ""
        Repository().login(email: email, password: pass) { (response) in
            self.hideLoading()
            if response.isSuccess() {
                let data = JsonParserManager.login(jsonString: response.rawData ?? "")
                let token = data?.data?.token ?? ""
                let email = data?.data?.email ?? ""
                let fullName = data?.data?.fullName ?? ""
                UserDataManager.shared.setFullName(fullName: fullName)
                let avtUrl = data?.data?.avatarURL ?? ""
                UserDataManager.shared.setLinkAvatar(linkAvartar: avtUrl)
                let birthDay = data?.data?.birthday ?? ""
                UserDataManager.shared.setBirthDay(day: birthDay)
                let storyBoad = UIStoryboard(name: "Main", bundle: nil)
                if let tabbar: UITabBarController = storyBoad.instantiateViewController(withIdentifier: "MainTabbarVC") as? UITabBarController {
                    UserDataManager.shared.setToken(token: token)
                    UserDataManager.shared.setEmail(email: email)
                    UserDataManager.shared.setPass(pass: pass)
                    tabbar.selectedIndex = 0
                    self.navigationController?.pushViewController(tabbar, animated: true)
                }
            } else {
                self.showAlert(message: response.message)
            }
        }
    }
}
