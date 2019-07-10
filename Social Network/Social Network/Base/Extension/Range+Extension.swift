//
//  Range+Extension.swift
//  Format
//
//  Created by Nguyễn Trung on 1/2/19.
//  Copyright © 2019 Nguyễn Trung. All rights reserved.
//

import Foundation
import UIKit

extension Range where Bound == String.Index {
    var nsRange:NSRange {
        return NSRange(location: self.lowerBound.encodedOffset,
                       length: self.upperBound.encodedOffset -
                        self.lowerBound.encodedOffset)
    }
}
