//
//  ViewController.swift
//  Social Network
//
//  Created by eragon on 6/24/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit
import Firebase



class AuthenticationVC: BaseViewController {

    @IBOutlet weak var buttonRegister: UIButton!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var tfDateRegister: UITextField!
    @IBOutlet weak var tfPasswordRegister: UITextField!
    @IBOutlet weak var tfEmailRegister: UITextField!
    @IBOutlet weak var tfNumberPhoneRegister: UITextField!
    @IBOutlet weak var tfNameRegister: UITextField!
    @IBOutlet weak var tfPasswordLogin: UITextField!
    @IBOutlet weak var tfEmailLogin: UITextField!
    @IBOutlet weak var viewRegister: UIView!
    @IBOutlet weak var viewLogin: UIView!
    private var datePicker: UIDatePicker?
    @IBAction func touchLogin(_ sender: Any) {
        self.viewRegister.isHidden = true
        self.viewLogin.isHidden = false
        self.buttonLogin.backgroundColor = UIColor.init(hexStr: "222222")
        self.buttonLogin.setTitleColor(UIColor.white, for: .normal)
        self.buttonRegister.backgroundColor = UIColor.white
        self.buttonRegister.setTitleColor(UIColor.init(hexStr: "222222"), for: .normal)
    }
    @IBAction func touchRegister(_ sender: Any) {
        self.viewLogin.isHidden = true
        self.viewRegister.isHidden = false
        self.buttonRegister.backgroundColor = UIColor.init(hexStr: "222222")
        self.buttonRegister.setTitleColor(UIColor.white, for: .normal)
        self.buttonLogin.backgroundColor = UIColor.white
        self.buttonLogin.setTitleColor(UIColor.init(hexStr: "222222"), for: .normal)
    }
    @IBAction func btnRegister(_ sender: Any) {
        self.showLoading()
        Repository().register(email: self.tfEmailRegister.text ?? "", password: self.tfPasswordRegister.text ?? "", userName: self.tfNameRegister.text ?? "") { [unowned self] (response) in
            self.hideLoading()
            if response.isSuccess() {
                let data = JsonParserManager.register(jsonString: response.rawData ?? "")
                let token = data?.data?.token ?? ""
                let email = data?.data?.email ?? ""
                let password = self.tfPasswordRegister.text ?? ""
                let fullName = data?.data?.fullName ?? ""
                let userName = data?.data?.userName ?? ""
                let mainSB = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                let vc = mainSB.instantiateViewController(withIdentifier: "ProfileRegisterVC") as! ProfileRegisterVC
                vc.userName = data?.data?.userName ?? ""
                vc.token = data?.data?.token ?? ""
                UserDataManager.shared.setFullName(fullName: fullName)
                UserDataManager.shared.setToken(token: token)
                UserDataManager.shared.setEmail(email: email)
                UserDataManager.shared.setPass(pass: password)
                UserDataManager.shared.setUserName(userName: userName)
                self.registerFireBaseAC()
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                self.showAlert(message: response.message)
            }
        }
    }
    @IBAction func btnLogin(_ sender: Any) {
        self.showLoading()
        Repository().login(email: self.tfEmailLogin.text ?? "", password: self.tfPasswordLogin.text ?? "") { [unowned self] (response) in
            self.hideLoading()
            if response.isSuccess() {
                self.loginFireBaseAC()
                let data = JsonParserManager.login(jsonString: response.rawData ?? "")
                let token = data?.data?.token ?? ""
                let email = data?.data?.email ?? ""
                let password = self.tfPasswordLogin.text ?? ""
                let fullName = data?.data?.fullName ?? ""
                let avtUrl = data?.data?.avatarURL ?? ""
                let birthDay = data?.data?.birthday ?? ""
                let userName = data?.data?.userName ?? ""
                let phone = data?.data?.phone
                if birthDay == "" || phone == "" {
                    let mainSB = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                    let vc = mainSB.instantiateViewController(withIdentifier: "ProfileRegisterVC") as! ProfileRegisterVC
                    vc.userName = data?.data?.userName ?? ""
                    vc.token = data?.data?.token ?? ""
                    UserDataManager.shared.setUserName(userName: userName)
                    UserDataManager.shared.setBirthDay(day: birthDay)
                    UserDataManager.shared.setFullName(fullName: fullName)
                    UserDataManager.shared.setLinkAvatar(linkAvartar: avtUrl)
                    UserDataManager.shared.setToken(token: token)
                    UserDataManager.shared.setEmail(email: email)
                    UserDataManager.shared.setPass(pass: password)
                    self.navigationController?.pushViewController(vc, animated: true)
                } else {
                    let storyBoad = UIStoryboard(name: "Main", bundle: nil)
                    if let tabbar: UITabBarController = storyBoad.instantiateViewController(withIdentifier: "MainTabbarVC") as? UITabBarController {
                        UserDataManager.shared.setToken(token: token)
                        UserDataManager.shared.setFullName(fullName: fullName)
                        UserDataManager.shared.setBirthDay(day: birthDay)
                        UserDataManager.shared.setUserName(userName: userName)
                        UserDataManager.shared.setLinkAvatar(linkAvartar: avtUrl)
                        UserDataManager.shared.setEmail(email: email)
                        UserDataManager.shared.setPass(pass: password)
                        tabbar.selectedIndex = 0
                        self.navigationController?.pushViewController(tabbar, animated: true)
                    }
                }
            } else {
                self.showAlert(message: response.message)
            }
        }
    }
    @IBAction func touchHidePasswordRegister(_ sender: Any) {
        if tfPasswordRegister.isSecureTextEntry == true {
            self.tfPasswordRegister.isSecureTextEntry = false
        } else {
            self.tfPasswordRegister.isSecureTextEntry = true
        }
    }
    @IBAction func touchHidePasswordLogin(_ sender: Any) {
        if tfPasswordLogin.isSecureTextEntry == true {
            self.tfPasswordLogin.isSecureTextEntry = false
        } else {
            self.tfPasswordLogin.isSecureTextEntry = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tfPasswordLogin.isSecureTextEntry = true
        self.tfPasswordRegister.isSecureTextEntry = true
        self.setupDatePicker()
    }

    func registerFireBaseAC() {
        Auth.auth().createUser(withEmail: tfEmailRegister.text ?? "", password: tfPasswordRegister.text ?? "") { authResult, error in
            if error == nil {
                print("Đăng ký thành công")
                Auth.auth().signIn(withEmail: self.tfEmailRegister.text ?? "", password: self.tfPasswordRegister.text ?? "") { [weak self] user, error in
                    if error == nil {
                        print("Đăng nhập thành công")
                    } else {
                        self?.showAlert(message: "Login Firebase Fail")
                    }
                }
            } else {
                self.showAlert(message: "Register Firebase Fail")
            }
        }
    }
    func loginFireBaseAC() {
        Auth.auth().signIn(withEmail: self.tfEmailLogin.text ?? "", password: self.tfPasswordLogin.text ?? "") { [weak self] user, error in
            if error == nil {
                print("Đăng nhập thành công")
            } else {
                self?.showAlert(message: "Login Firebase Fail")
            }
        }
    }
    func setupDatePicker() {
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        tfDateRegister.inputView = datePicker
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(AuthenticationVC.dissmissPicker))
        tfDateRegister.inputAccessoryView = toolBar
    }
    @objc func dissmissPicker() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        tfDateRegister.text = dateFormatter.string(from: (datePicker?.date)!)
        view.endEditing(true)
    }
}

