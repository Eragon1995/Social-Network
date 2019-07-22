//
//  ProfileRegisterVC.swift
//  Social Network
//
//  Created by Husky on 7/22/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit
import Alamofire

class ProfileRegisterVC: BaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var lblBirthDay: UITextField!
    @IBOutlet weak var lblNumberPhone: UITextField!
    @IBOutlet weak var lblUserName: UITextField!
    @IBOutlet weak var lblFullName: UITextField!
    @IBOutlet weak var imgAvatar: UIImageView!
    var userName: String = ""
    var imgData: Data!
    private var datePicker: UIDatePicker?
    
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
        self.uploadImage(data: imgData, withName: "uploadFiles[]", fileName: "\(fileName).jpeg", mimeType: "image/jpeg")
    }
    
    func uploadImage(data: Data, withName: String, fileName: String, mimeType: String) {
        self.showLoading()
        Alamofire.upload(multipartFormData:{
            multipartFormData in
            multipartFormData.append(data, withName: "uploadFiles[]", fileName: fileName, mimeType: mimeType)},
                         usingThreshold:UInt64.init(),
                         to:URLConst.UPLOAD_AVATAR_URL,
                         method:.post,
                         headers:["token": UserDataManager.shared.getToken()! ],
                         encodingCompletion: { encodingResult in
                            switch encodingResult {
                            case .success(let upload, _, _ ):
                                upload.responseJSON { response in
                                    self.hideLoading()
                                    debugPrint(response)
                                    print("Upload Avatar Success")
                                }
                            case .failure(let encodingError):
                                self.hideLoading()
                                print(encodingError)
                            }
        })
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
}
