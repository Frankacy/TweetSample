//
//  NewTweet.swift
//  TweetSample
//
//  Created by Francois Courville on 2017-01-13.
//  Copyright © 2017 Francois Courville. All rights reserved.
//

import Foundation
import UIKit

struct NewTweet : TweetDisplayable {
    var text: String
    var image: UIImage?
    var hashtags: [String]

    init() {
        text = ""
        hashtags = []
    }

    func header() -> String {
        return "Frank Courville \u{f8ff} - Frankacy"
    }

    func content() -> String {
        let hashtags = self.hashtags.joined(separator: " ")
        return "\(text) - \(hashtags)"
    }

    func tweetImage() -> UIImage? {
        return image
    }
}
