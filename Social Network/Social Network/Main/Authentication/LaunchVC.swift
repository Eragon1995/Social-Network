//
//  LaunchVC.swift
//  Social Network
//
//  Created by Husky on 7/15/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit
import Firebase

let storage = Storage.storage()
let storageRef = storage.reference(forURL: "gs://mangxahoi-8463d.appspot.com")

class LaunchVC: BaseViewController {

    let email = UserDataManager.shared.getEmail() ?? ""
    let pass = UserDataManager.shared.getPass() ?? ""
    
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
        Repository().login(email: email, password: pass) { (response) in
            self.hideLoading()
            if response.isSuccess() {
                self.loginFireBaseAC()
                let data = JsonParserManager.login(jsonString: response.rawData ?? "")
                let token = data?.data?.token ?? ""
                let email = data?.data?.email ?? ""
                let fullName = data?.data?.fullName ?? ""
                let avtUrl = data?.data?.avatarURL ?? ""
                let birthDay = data?.data?.birthday ?? ""
                let phone = data?.data?.phone
                let userName = data?.data?.userName ?? ""
                if birthDay == "" || phone == "" {
                    let mainSB = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                    let vc = mainSB.instantiateViewController(withIdentifier: "ProfileRegisterVC") as! ProfileRegisterVC
                    vc.userName = data?.data?.userName ?? ""
                    UserDataManager.shared.setLinkAvatar(linkAvartar: avtUrl)
                    UserDataManager.shared.setFullName(fullName: fullName)
                    UserDataManager.shared.setUserName(userName: userName)
                    UserDataManager.shared.setToken(token: token)
                    UserDataManager.shared.setBirthDay(day: birthDay)
                    UserDataManager.shared.setEmail(email: email)
                    UserDataManager.shared.setPass(pass: self.pass)
                    self.navigationController?.pushViewController(vc, animated: true)
                } else {
                    let storyBoad = UIStoryboard(name: "Main", bundle: nil)
                    if let tabbar: UITabBarController = storyBoad.instantiateViewController(withIdentifier: "MainTabbarVC") as? UITabBarController {
                        UserDataManager.shared.setToken(token: token)
                        UserDataManager.shared.setLinkAvatar(linkAvartar: avtUrl)
                        UserDataManager.shared.setFullName(fullName: fullName)
                        UserDataManager.shared.setUserName(userName: userName)
                        UserDataManager.shared.setBirthDay(day: birthDay)
                        UserDataManager.shared.setEmail(email: email)
                        UserDataManager.shared.setPass(pass: self.pass)
                        tabbar.selectedIndex = 0
                        self.navigationController?.pushViewController(tabbar, animated: true)
                    }
                }
            } else {
                self.showAlert(message: response.message)
            }
        }
    }
    func loginFireBaseAC() {
        Auth.auth().signIn(withEmail: email, password: pass) { [weak self] user, error in
            if error == nil {
                print("Đăng nhập thành công")
            } else {
                self?.showAlert(message: "Login Firebase Fail")
            }
        }
    }
}
