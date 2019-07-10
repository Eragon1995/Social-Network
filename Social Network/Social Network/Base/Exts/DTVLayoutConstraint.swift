//
//  DTVLayoutConstraint.swift
//  TrueJuice
//
//  Created by Tran Van Dinh on 7/16/17.
//  Copyright © 2017 Hoc Nguyen. All rights reserved.
//

import UIKit

class DTVLayoutConstraint: NSLayoutConstraint {

    @IBInspectable var LC4Inch: CGFloat = 0.0
        { didSet
        {
            if UIScreen.main.nativeBounds.height == 1136
            {
                self.constant = LC4Inch
            }
        }
    }
    @IBInspectable var LC4Inch7: CGFloat = 0.0
        { didSet
        {
            if UIScreen.main.nativeBounds.height == 1334
            {
                self.constant = LC4Inch7
            }
        }
    }
    @IBInspectable var ipad: CGFloat = 0.0
        { didSet
        {
           if UIDevice.current.userInterfaceIdiom == .pad
            {
                    self.constant = ipad
            }
            
        }
    }
}
