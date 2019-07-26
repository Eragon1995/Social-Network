//
//  CellListFriend.swift
//  Social Network
//
//  Created by Husky on 7/25/19.
//  Copyright © 2019 eragon. All rights reserved.
//

import UIKit

class CellListFriend: UITableViewCell {

    @IBOutlet weak var lblChat: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
