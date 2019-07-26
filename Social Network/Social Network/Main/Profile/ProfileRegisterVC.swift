//
//  ProfileRegisterVC.swift
//  Social Network
//
//  Created by Husky on 7/22/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Firebase

class ProfileRegisterVC: BaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblBirthDay: UITextField!
    @IBOutlet weak var lblNumberPhone: UITextField!
    @IBOutlet weak var lblUserName: UITextField!
    @IBOutlet weak var lblFullName: UITextField!
    @IBOutlet weak var imgAvatar: UIImageView!
    var userName: String = ""
    var imgData: Data!
    var controller: String = ""
    var token: String = ""
    private var datePicker: UIDatePicker?
    
    @IBAction func touchBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func touchUploadAvt(_ sender: Any) {
        let alert:UIAlertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let btnPhoto:UIAlertAction = UIAlertAction(title: "Photo", style: .destructive) { (UIAlertAction) in
            let imgPicker = UIImagePickerController()
            imgPicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imgPicker.delegate = self
            imgPicker.allowsEditing = false
            self.present(imgPicker, animated: true, completion: nil)
        }
        let btnDone: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
        }
        let btnCamera:UIAlertAction = UIAlertAction(title: "Camera", style: .destructive) { (UIAlertAction) in
            if(UIImagePickerController.isSourceTypeAvailable(.camera))
            {
                let imgPicker = UIImagePickerController()
                imgPicker.sourceType = UIImagePickerController.SourceType.camera
                imgPicker.delegate = self
                imgPicker.allowsEditing = false
                self.present(imgPicker, animated: true, completion: nil)
            }else
            {
                let imgPicker = UIImagePickerController()
                imgPicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                imgPicker.delegate = self
                imgPicker.allowsEditing = false
                self.present(imgPicker, animated: true, completion: nil)
            }
        }
        alert.addAction(btnPhoto)
        alert.addAction(btnCamera)
        alert.addAction(btnDone)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupDatePicker()
        self.lblFullName.text = UserDataManager.shared.getFullName()
        self.lblUserName.text = self.userName
        guard let img = UserDataManager.shared.getLinkAvatar() else {
            return
        }
        if let url = URL(string: img) {
            self.imgAvatar.kf.setImage(with: url)
        }
        if self.controller == "Edit" {
            self.btnBack.isHidden = false
            self.lblHeader.text = "Thông tin cá nhân"
            self.btnDone.setTitle("Chỉnh sửa", for: .normal)
            self.getMyProfile()
        } else {
            self.btnBack.isHidden = true
            self.lblHeader.text = "Hoàn tất thông tin"
            self.btnDone.setTitle("Hoàn thành", for: .normal)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chooseImg = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        let imgValue = max(chooseImg.size.width, chooseImg.size.height)
        if(imgValue > 3000){
            imgData = chooseImg.jpegData(compressionQuality: 0.1)
        }else if(imgValue > 2000){
            imgData = chooseImg.jpegData(compressionQuality: 0.3)
        }else{
            imgData = chooseImg.jpegData(compressionQuality: 0)
        }
        
        imgAvatar.image = UIImage(data: imgData)
        dismiss(animated: true, completion: nil)
        let fileName = NSUUID().uuidString
        self.uploadImage(data: imgData, withName: "uploadFile", fileName: "\(fileName).jpeg", mimeType: "image/jpeg")
    }
    
    func uploadImage(data: Data, withName: String, fileName: String, mimeType: String) {
        var parameters = [ :
            
        ] as [String : Any]
        if let token = UserDataManager.shared.getToken() {
            parameters["token"] = token
        }
        Alamofire.upload(multipartFormData:{
            multipartFormData in
            for (key, value) in parameters {
                if let value = value as? String {
                    multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                }
            }
            multipartFormData.append(data, withName: "uploadFile", fileName: fileName, mimeType: mimeType)
        },
                         usingThreshold:UInt64.init(),
                         to: URLConst.UPLOAD_AVATAR_URL) { (result) in
                            switch result {
                            case .success(let upload, _, _):
                                upload.uploadProgress(closure: { (progress) in
                                })
                                
                                upload.responseJSON { response in
                                    if let json = response.result.value
                                    {
                                        if let jsonData = JSON(json).dictionary, let data = jsonData["data"]?.dictionary
                                        {
                                            let url = data["avatar_url"]?.stringValue ?? ""
                                            print("LEU LEU \(url)")
                                            UserDataManager.shared.setLinkAvatar(linkAvartar: url)
                                            self.loadAvatarFirebase()
                                        }
                                    }
                                }
                                
                            case .failure(let encodingError):
                                print(encodingError)
                            }
        }
    }
    
    func updateProfile() {
        let token = UserDataManager.shared.getToken() ?? ""
        self.showLoading()
        Repository().updateProfile(token: token,fullName: self.lblFullName.text ?? "", userName: self.lblUserName.text ?? "", phone: self.lblNumberPhone.text ?? "", birhday: self.lblBirthDay.text ?? "") { [unowned self] (reponse) in
            self.hideLoading()
            if reponse.isSuccess() {
                let data = JsonParserManager.updateProfile(jsonString: reponse.rawData ?? "")
                let fullName = data?.data.first?.fullName ?? ""
                UserDataManager.shared.setFullName(fullName: fullName)
                let storyBoad = UIStoryboard(name: "Main", bundle: nil)
                if let tabbar: UITabBarController = storyBoad.instantiateViewController(withIdentifier: "MainTabbarVC") as? UITabBarController {
                    tabbar.selectedIndex = 0
                    self.navigationController?.pushViewController(tabbar, animated: true)
                }
            } else {
                self.showAlert(message: reponse.message)
            }
        }
    }
    @IBAction func touchDone(_ sender: Any) {
        self.updateProfile()
    }
    func loadAvatarFirebase() {
        let email = UserDataManager.shared.getEmail() ?? ""
        let avatarRef = storageRef.child("images/\(email).ipg")
        let uploadTask = avatarRef.putData(self.imgData, metadata: nil) { metadata, error in
            if error != nil {
                print("AVT Error")
            } else {
                avatarRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    return
                    }
                    let user = Auth.auth().currentUser
                    if let user = user {
                        let changeRequest = user.createProfileChangeRequest()
                        let fullName = UserDataManager.shared.getFullName() ?? ""
                        changeRequest.displayName = fullName
                        changeRequest.photoURL = downloadURL
                        changeRequest.commitChanges(completion: { (error) in
                            if(error == nil)
                            {
                                print("UpLoadProfile Firebase Success")
                            }else
                            {
                                print("Error upload profile")
                            }
                        })
                    }
                }
            }
        }
        uploadTask.resume()
    }
    func setupDatePicker() {
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        self.lblBirthDay.inputView = datePicker
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(ProfileRegisterVC.dissmissPicker))
        self.lblBirthDay.inputAccessoryView = toolBar
    }
    @objc func dissmissPicker() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        self.lblBirthDay.text = dateFormatter.string(from: (datePicker?.date)!)
        view.endEditing(true)
    }
    func getMyProfile() {
        self.showLoading()
        let token = UserDataManager.shared.getToken() ?? ""
        Repository().profile(token: token) { (response) in
            self.hideLoading()
            if response.isSuccess() {
                let data = JsonParserManager.profile(jsonString: response.rawData ?? "")
                self.lblFullName.text = data?.data.fullName ?? ""
                self.lblUserName.text = data?.data.userName ?? ""
                self.lblBirthDay.text = data?.data.birthday ?? ""
                self.lblNumberPhone.text = data?.data.phone ?? ""
            } else {
                self.showAlert(message: response.message)
            }
        }
    }
}
