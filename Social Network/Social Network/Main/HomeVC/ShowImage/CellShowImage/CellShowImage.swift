//
//  CellShowImage.swift
//  Social Network
//
//  Created by Husky on 7/30/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit

class CellShowImage: UICollectionViewCell {

    @IBOutlet weak var imgMain: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(url: String) {
        let data = URL(string: url)
        self.imgMain.kf.setImage(with: data, placeholder: nil, options: nil, progressBlock: nil) { (image, size, cache, url) in
        }
    }
}
