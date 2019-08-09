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

class PostNewVC: BaseViewController {

    @IBAction func touchShare(_ sender: Any) {
//        let text = "This is the text...."
//        let image = UIImage(named: "Product")
//        let myWebsite = NSURL(string:"https://www.impl.vn")
//        let shareAll = [text, image, myWebsite] as [Any]
//        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
//        activityViewController.popoverPresentationController?.sourceView = self.view
//        self.present(activityViewController, animated: true, completion: nil)
        var SelectedAssets = [PHAsset]()
        
        let vc = BSImagePickerViewController()
        vc.maxNumberOfSelections = 3
        vc.takePhotos = true
        bs_presentImagePickerController(vc, animated: true,
                                        select: { (asset: PHAsset) -> Void in
                                            print("Selected: 111111\(asset)")
        }, deselect: { (asset: PHAsset) -> Void in
            print("Deselected: 222222\(asset)")
        }, cancel: { (assets: [PHAsset]) -> Void in
            print("Cancel: 33333\(assets)")
        }, finish: { (assets: [PHAsset]) -> Void in
            print("Finish: 4444\(assets)")
            print(assets.count)
        }, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
