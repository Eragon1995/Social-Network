//
//  ViewController.swift
//  Social Network
//
//  Created by eragon on 6/24/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit
import AccountKit

class AuthenticationVC: BaseViewController, AKFViewControllerDelegate {

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
                print("leu leu \(data?.data.email ?? "") \(data?.data.fullName ?? "") \(data?.data.token ?? "")")
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
                let storyBoad = UIStoryboard(name: "Main", bundle: nil)
                if let tabbar: UITabBarController = storyBoad.instantiateViewController(withIdentifier: "MainTabbarVC") as? UITabBarController {
                    tabbar.selectedIndex = 0
                    self.navigationController?.pushViewController(tabbar, animated: true)
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
    }


}

