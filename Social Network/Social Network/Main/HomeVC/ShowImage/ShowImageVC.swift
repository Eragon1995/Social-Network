//
//  ShowImageVC.swift
//  Social Network
//
//  Created by Husky on 7/30/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit

class ShowImageVC: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var listImage: [String] = []
    @IBAction func touchHide(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //init collectionView
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 2.0
        layout.minimumInteritemSpacing = 2.0
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.register(UINib.init(nibName: "CellShowImage", bundle: nil), forCellWithReuseIdentifier: "CellShowImage")
        self.tabBarController?.tabBar.isHidden = true
        self.collectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.listImage.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellShowImage", for: indexPath) as! CellShowImage
        cell.configCell(url: self.listImage[indexPath.item])
        return cell
    }
}

extension ShowImageVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let heigt = UIScreen.main.bounds.height - 100
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: heigt)
    }
}
