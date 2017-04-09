//
//  Fonts.swift
//  TweetSample
//
//  Created by Francois Courville on 2017-04-08.
//  Copyright © 2017 Francois Courville. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    static func montserrat(size: CGFloat) -> UIFont {
        if let font = UIFont(name: "Montserrat-Regular", size: size) {
            return font
        } else {
            print("Error loading montserrat")
            return UIFont.systemFont(ofSize: size)
        }
    }

    static func montserratBold(size: CGFloat) -> UIFont {
        if let font = UIFont(name: "Montserrat-Bold", size: size) {
            return font
        } else {
            print("Error loading montserrat bold")
            return UIFont.systemFont(ofSize: size)
        }
    }
}
