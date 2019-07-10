//
//  UIImageView+Extension.swift
//  TokyoLife
//
//  Created by Tran Van Dinh on 7/31/18.
//  Copyright © 2018 EGLIFE. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    @IBInspectable var imageTintColor: UIColor? {
        get {
            return self.tintColor
        }
        set {
            if newValue != nil
            {
                self.image = self.image?.tint(with: newValue!)
            }
        }
    }
}
