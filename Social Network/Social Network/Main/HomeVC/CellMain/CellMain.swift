//
//  CellMain.swift
//  Social Network
//
//  Created by Husky on 7/15/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit
import Kingfisher

enum NumberPhoto: Int {
    case zero = 0
    case one = 1
    case two = 2
    case three = 3
    
}

protocol CellMainDelegate {
    func showMore(indexPath: IndexPath)
    func showImage(indexPath: IndexPath)
    func donatePost(indexPath: IndexPath)
}

class CellMain: UITableViewCell {

    var indexPath: IndexPath = IndexPath(row: -1, section: -1)
    var delegate: CellMainDelegate! = nil
    @IBOutlet weak var btnShowMore: UIButton!
    @IBOutlet weak var lblNumberComment: UILabel!
    @IBOutlet weak var lblNumberLike: UILabel!
    @IBOutlet weak var bigViewHeight: NSLayoutConstraint!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var viewImage3: UIView!
    @IBOutlet weak var viewImage2: UIView!
    @IBOutlet weak var viewImage1: UIView!
    @IBOutlet weak var imgMain: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    var model: PostPublicModel.List?
    var modelMyPost: MyPostModel.Datum?
    var section = -1
    @IBAction func touchLike(_ sender: Any) {
        delegate.donatePost(indexPath: indexPath)
    }
    @IBAction func touchShowMore(_ sender: Any) {
        delegate.showMore(indexPath: indexPath)
    }
    @IBAction func toucShowImage(_ sender: Any) {
        delegate.showImage(indexPath: indexPath)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(model: PostPublicModel.List, section: Int, controller: String) {
        self.model = model
        self.section = section
        if let user = model.user {
            if let avtUrl = user.avatarURL, avtUrl != "" {
                let url = URL(string: avtUrl)
                self.imgAvatar.kf.setImage(with: url)
            } else {
                self.imgAvatar.image = UIImage(named: "defaultAvt")
            }
            self.lblName.text = user.userName
        }
        if let like = model.totalRate {
            self.lblNumberLike.text = "\(like)"
        }
        if let numberComment = model.comments?.count {
            self.lblNumberComment.text = "\(numberComment)"
        }
        if let displayDate = model.displayDate {
            self.lblDate.text = covertTime(dateString: displayDate)
        }
        if let content = model.content {
            self.lblTitle.text = content
        }
        let controller: String = controller
        if controller == "HomeVC" {
            if let contenString = self.lblTitle.text {
                if contenString.count > 400 {
                    self.btnShowMore.isHidden = false
                    self.lblTitle.text = "\(contenString.prefix(400))"
                    self.showMore()
                } else {
                    self.btnShowMore.isHidden = true
                }
            }
        } else {
        }

        if let numberPhoto = NumberPhoto(rawValue: model.photos?.count ?? 0) {
            switch numberPhoto {
            case .zero:
                self.viewImage1.isHidden = false
                self.viewImage2.isHidden = true
                self.viewImage3.isHidden = true
                self.showZeroImage1(model: model)
                break
            case .one:
                self.viewImage1.isHidden = false
                self.viewImage2.isHidden = true
                self.viewImage3.isHidden = true
                self.showBigImage1(model: model)
                break
            case .two:
                self.viewImage1.isHidden = true
                self.viewImage2.isHidden = false
                self.viewImage3.isHidden = false
                self.showTwoImage1(model: model)
                break
            case .three:
                self.viewImage1.isHidden = false
                self.viewImage2.isHidden = false
                self.viewImage3.isHidden = false
                self.showThreeImage1(model: model)
                break
            }
        }
    }
    func configCellMyPost(model: MyPostModel.Datum, section: Int, controller: String) {
        self.modelMyPost = model
        self.section = section
        if let user = model.user {
            if let avtUrl = user.avatarURL, avtUrl != "" {
                let url = URL(string: avtUrl)
                self.imgAvatar.kf.setImage(with: url)
            } else {
                self.imgAvatar.image = UIImage(named: "defaultAvt")
            }
            self.lblName.text = user.userName
        }
        if let like = model.totalRate {
            self.lblNumberLike.text = "\(like)"
        }
        if let numberComment = model.comments?.count {
            self.lblNumberComment.text = "\(numberComment)"
        }
        if let displayDate = model.displayDate {
            self.lblDate.text = covertTime(dateString: displayDate)
        }
        if let content = model.content {
            self.lblTitle.text = content
        }
        let controller: String = controller
        if controller == "HomeVC" {
            if let contenString = self.lblTitle.text {
                if contenString.count > 400 {
                    self.btnShowMore.isHidden = false
                    self.lblTitle.text = "\(contenString.prefix(400))"
                    self.showMore()
                } else {
                    self.btnShowMore.isHidden = true
                }
            }
        } else {
        }
        
        if let numberPhoto = NumberPhoto(rawValue: model.photos?.count ?? 0) {
            switch numberPhoto {
            case .zero:
                self.viewImage1.isHidden = false
                self.viewImage2.isHidden = true
                self.viewImage3.isHidden = true
                self.showZeroImage(model: model)
                break
            case .one:
                self.viewImage1.isHidden = false
                self.viewImage2.isHidden = true
                self.viewImage3.isHidden = true
                self.showBigImage(model: model)
                break
            case .two:
                self.viewImage1.isHidden = true
                self.viewImage2.isHidden = false
                self.viewImage3.isHidden = false
                self.showTwoImage(model: model)
                break
            case .three:
                self.viewImage1.isHidden = false
                self.viewImage2.isHidden = false
                self.viewImage3.isHidden = false
                self.showThreeImage(model: model)
                break
            }
        }
    }
}
extension CellMain {
    func showMore() {
        guard let contenString = self.lblTitle.text else { return }
        let dataString = NSMutableAttributedString(string: "\(contenString) ...xem thêm")
        let myRanger = NSRange(location: dataString.length - 8, length: 8)
        let attrs: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        dataString.addAttributes(attrs, range: myRanger)
        self.lblTitle.attributedText = dataString
    }
    func covertTime(dateString: String) -> String {
        let dateString = "\(dateString)+0000"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let newDate = dateFormatter.string(from: date)
            return newDate
        } else {
            return ""
        }
    }
    func showZeroImage(model: MyPostModel.Datum) {
        let ratio: CGFloat = CGFloat(1)
        let bigViewWidth = UIScreen.main.bounds.width - 2 * AppConst.LEADING_TRANILING_VIEW_HEADER_CELL - 8
        self.bigViewHeight.constant = bigViewWidth / ratio
        let listImg: [String] = UserDataManager.shared.listImage
        let image = listImg.randomElement() ?? ""
        if let url = URL(string: image) {
            self.imgMain.kf.setImage(with: url)
        }
    }
    func showBigImage(model: MyPostModel.Datum) {
        if var heigt = model.photos?[0].imageHeight, var width = model.photos?[0].imageWidth {
            if heigt == 0 {
                heigt = 1
            }
            if width == 0 {
                width = 1
            }
            let ratio: CGFloat = CGFloat(width) / CGFloat(heigt)
            let bigViewWidth = UIScreen.main.bounds.width - 2 * AppConst.LEADING_TRANILING_VIEW_HEADER_CELL - 8
            self.bigViewHeight.constant = bigViewWidth / ratio
        }
        if let path = model.photos?[0].path {
            if let img = Utils.shared.getCachedImage(urlString: path) {
                //set Image
                self.imgMain.image = img
            } else {
                if let url = URL(string: path) {
                    self.imgMain.kf.setImage(with: url)
                }
            }
        }
    }
    func showTwoImage(model: MyPostModel.Datum) {
        if let path1 = model.photos?[0].path {
            if let img = Utils.shared.getCachedImage(urlString: path1) {
                //setImage
                self.img2.image = img
            } else {
                if let url1 = URL(string: path1) {
                    self.img2.kf.setImage(with: url1)
                }
            }
        }
        if let path2 = model.photos?[1].path {
            if let img = Utils.shared.getCachedImage(urlString: path2) {
                //setImage
                self.img3.image = img
            } else {
                if let url2 = URL(string: path2) {
                    self.img2.kf.setImage(with: url2)
                }
            }
        }
    }
    func showThreeImage(model: MyPostModel.Datum) {
        self.showBigImage(model: model)
        if let path1 = model.photos?[1].path {
            if let img = Utils.shared.getCachedImage(urlString: path1) {
                //setImage
                self.img2.image = img
            } else {
                if let url1 = URL(string: path1) {
                    self.img2.kf.setImage(with: url1)
                }
            }
        }
        if let path2 = model.photos?[2].path {
            if let img = Utils.shared.getCachedImage(urlString: path2) {
                //setImage
                self.img3.image = img
            } else {
                if let url2 = URL(string: path2) {
                    self.img2.kf.setImage(with: url2)
                }
            }
        }
    }
    
    func showZeroImage1(model: PostPublicModel.List) {
        let ratio: CGFloat = CGFloat(1)
        let bigViewWidth = UIScreen.main.bounds.width - 2 * AppConst.LEADING_TRANILING_VIEW_HEADER_CELL - 8
        self.bigViewHeight.constant = bigViewWidth / ratio
        let listImg: [String] = UserDataManager.shared.listImage
        let image = listImg.randomElement() ?? ""
        if let url = URL(string: image) {
            self.imgMain.kf.setImage(with: url)
        }
    }
    func showBigImage1(model: PostPublicModel.List) {
        if var heigt = model.photos?[0].imageHeight, var width = model.photos?[0].imageWidth {
            if heigt == 0 {
                heigt = 1
            }
            if width == 0 {
                width = 1
            }
            let ratio: CGFloat = CGFloat(width) / CGFloat(heigt)
            let bigViewWidth = UIScreen.main.bounds.width - 2 * AppConst.LEADING_TRANILING_VIEW_HEADER_CELL - 8
            self.bigViewHeight.constant = bigViewWidth / ratio
        }
        if let path = model.photos?[0].path {
            if let img = Utils.shared.getCachedImage(urlString: path) {
                //set Image
                self.imgMain.image = img
            } else {
                if let url = URL(string: path) {
                    self.imgMain.kf.setImage(with: url)
                }
            }
        }
    }
    func showTwoImage1(model: PostPublicModel.List) {
        if let path1 = model.photos?[0].path {
            if let img = Utils.shared.getCachedImage(urlString: path1) {
                //setImage
                self.img2.image = img
            } else {
                if let url1 = URL(string: path1) {
                    self.img2.kf.setImage(with: url1)
                }
            }
        }
        if let path2 = model.photos?[1].path {
            if let img = Utils.shared.getCachedImage(urlString: path2) {
                //setImage
                self.img3.image = img
            } else {
                if let url2 = URL(string: path2) {
                    self.img2.kf.setImage(with: url2)
                }
            }
        }
    }
    func showThreeImage1(model: PostPublicModel.List) {
        self.showBigImage1(model: model)
        if let path1 = model.photos?[1].path {
            if let img = Utils.shared.getCachedImage(urlString: path1) {
                //setImage
                self.img2.image = img
            } else {
                if let url1 = URL(string: path1) {
                    self.img2.kf.setImage(with: url1)
                }
            }
        }
        if let path2 = model.photos?[2].path {
            if let img = Utils.shared.getCachedImage(urlString: path2) {
                //setImage
                self.img3.image = img
            } else {
                if let url2 = URL(string: path2) {
                    self.img2.kf.setImage(with: url2)
                }
            }
        }
    }
}
