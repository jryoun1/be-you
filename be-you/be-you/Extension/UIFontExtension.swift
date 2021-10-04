//
//  UIFontExtension.swift
//  be-you
//
//  Created by wonhee on 2021/10/04.
//

import UIKit

extension UIFont {
    enum NotoSansType: String {
        case bold = "NotoSansKR-Bold"
        case regular = "NotoSansKR-Regular"
    }

    convenience init?(type: NotoSansType, size: CGFloat) {
        self.init(
            name: type.rawValue,
            size: size
        )
    }
}

