//
//  CellComment.swift
//  Social Network
//
//  Created by Husky on 7/15/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit

class CellComment: UITableViewCell {

    @IBOutlet weak var imageHeigt: NSLayoutConstraint!
    @IBOutlet weak var imgMain: UIImageView!
    @IBOutlet weak var lblConten: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    var model: PostPublicModel.Comment?
    var indexPath = IndexPath(row: -1, section: -1)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
        // Configure the view for the selected state
    }
    
    func configCell(model: PostPublicModel.Comment, indexPath: IndexPath) {
        self.indexPath = indexPath
        self.model = model
        if let user = model.user {
            if let avatarUrl = user.avatarURL, let url = URL(string: avatarUrl), avatarUrl != "" {
                self.imgAvatar.kf.setImage(with: url)
            } else {
                self.imgAvatar.image = UIImage.init(named: "defaultAvt")
            }
            self.lblName.text = user.userName
        }
        if let content = model.content {
            self.lblConten.text = content
        }
        // ratioImage
        if let photo = model.photos?.first {
            if var height = photo.imageHeight, var width = photo.imageWidth {
                if height == 0 {
                    height = 1
                }
                if width == 0 {
                    width = 1
                }
                let ratio: CGFloat = CGFloat(width) / CGFloat(height)
                let bigViewWidth = self.imgMain.frame.size.width
                self.imageHeigt.constant = bigViewWidth / ratio
            }
            if let imageUrl = photo.path {
                if let img = Utils.shared.getCachedImage(urlString: imageUrl) {
                    //set image
                    self.imgMain.image = img
                } else {
                    if let url = URL(string: imageUrl) {
                        self.imgMain.kf.setImage(with: url)
                    }
                }
            }
        }
    }
}
