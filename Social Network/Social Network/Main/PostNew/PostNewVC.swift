//
//  PostNewVC.swift
//  Social Network
//
//  Created by Husky on 7/17/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit
import BSImagePicker
import BSImageView
import Photos
import Alamofire
import SwiftyJSON
import Firebase
import IQKeyboardManagerSwift

class PostNewVC: BaseViewController {

    @IBOutlet weak var btnAddImg: UIButton!
    @IBOutlet weak var tfContent: UITextField!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBAction func touchPost(_ sender: Any) {
        self.createPost()
    }
    @IBAction func touchTest(_ sender: Any) {
        self.initVC()
    }
    @IBOutlet weak var imgTest: UIImageView!
    var listIdImg: [String] = []
    @IBAction func touchShare(_ sender: Any) {
//        let text = "This is the text...."
//        let image = UIImage(named: "Product")
//        let myWebsite = NSURL(string:"https://www.impl.vn")
//        let shareAll = [text, image, myWebsite] as [Any]
//        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
//        activityViewController.popoverPresentationController?.sourceView = self.view
//        self.present(activityViewController, animated: true, completion: nil)
        self.listIdImg.removeAll()
        let vc = BSImagePickerViewController()
        vc.maxNumberOfSelections = 3
        vc.takePhotos = true
        bs_presentImagePickerController(vc, animated: true,
                                        select: { (asset: PHAsset) -> Void in
        }, deselect: { (asset: PHAsset) -> Void in
            
        }, cancel: { (assets: [PHAsset]) -> Void in
            
        }, finish: { (assets: [PHAsset]) -> Void in
            var dataImg = [Data]()
            dataImg.removeAll()
            for asset in assets {
                let manager = PHImageManager.default()
                let option = PHImageRequestOptions()
                var image = UIImage()
                option.isSynchronous = true
                manager.requestImage(for: asset, targetSize: CGSize(width: 375, height: 375), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
                    image = result!
                    let i = image.pngData() ?? Data()
                    dataImg.append(i)
                    let fileName = NSUUID().uuidString
                    self.uploadImage(data: i, withName: "uploadFile", fileName: "\(fileName).jpeg", mimeType: "image/jpeg")
                })
            }
            if dataImg.count == 1 {
                self.imgTest.isHidden = false
                self.imgTest.image = UIImage(data: dataImg[0])
            }
            if dataImg.count == 2 {
                self.imgTest.isHidden = false
                self.img2.isHidden = false
                self.imgTest.image = UIImage(data: dataImg[0])
                self.img2.image = UIImage(data: dataImg[1])
            }
            if dataImg.count == 3 {
                self.imgTest.isHidden = false
                self.img2.isHidden = false
                self.imgTest.image = UIImage(data: dataImg[0])
                self.img2.image = UIImage(data: dataImg[1])
                self.img3.isHidden = false
                self.img3.image = UIImage(data: dataImg[2])
                self.btnAddImg.isHidden = true
            }
        }, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initVC()
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Đóng"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.initVC()
    }
    
    func initVC() {
        self.tfContent.text = ""
        self.imgTest.isHidden = true
        self.img2.isHidden = true
        self.img3.isHidden = true
        self.listIdImg.removeAll()
        self.btnAddImg.isHidden = false
    }
    
    func createPost() {
        if self.tfContent.text?.count == 0 {
            self.showAlertMessage(message: "Nội dụng không được để trống") {
                self.tfContent.becomeFirstResponder()
            }
            return
        }
        self.showLoading()
        let token = UserDataManager.shared.getToken() ?? ""
        Repository().createPost(token: token, roomType: 0, content: self.tfContent.text ?? "" , photoIds: "\(self.listIdImg)") { (response) in
            self.hideLoading()
            if response.isSuccess() {
                self.showAlertMessage(message: "Đăng bài thành công", callback: {
                    let mainSb = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                    let vc = mainSb.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                    self.navigationController?.pushViewController(vc, animated: true)
                })
            } else {
                self.showAlert(message: response.message)
            }
        }
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
            multipartFormData.append(data, withName: "uploadFiles[]", fileName: fileName, mimeType: mimeType)
        },
                         usingThreshold:UInt64.init(),
                         to: URLConst.POST_PHOTO_UPLOAD) { (result) in
                            switch result {
                            case .success(let upload, _ , _ ):
                                upload.responseJSON { response in
                                    if let json = response.result.value
                                    {
                                        if let jsonData = JSON(json).dictionary, let data = jsonData["data"]?.dictionary
                                        {
                                            //                            print("data getlist = \(data)")
                                            if let items = data["list"]?.array
                                            {
                                                for item in items
                                                {
                                                    let idImg = item["id"].int ?? 0
                                                    let idString: String = "\(idImg)"
                                                    print("LEU LEU \(idString) \(idImg)")
                                                    self.listIdImg.append(idString)
                                                }
                                            }
                                        }
                                    }
                                }
                            case .failure(let encodingError):
                                self.hideLoading()
                                print(encodingError)
                            }
        }
    }
    
}
