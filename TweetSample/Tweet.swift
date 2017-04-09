//
//  Tweet.swift
//  TweetSample
//
//  Created by Francois Courville on 2017-01-12.
//  Copyright © 2017 Francois Courville. All rights reserved.
//

import Foundation
import UIKit

protocol TweetDisplayable {
    func header() -> String
    func content() -> String
    func tweetImage() -> UIImage?
}

struct Tweet : TweetDisplayable {
    let name: String
    let handle: String
    let text: String

    init?(json: [String: Any?]) {
        guard let user = json["user"] as? [String: Any?],
            let name = user["name"] as? String,
            let handle = user["screen_name"] as? String,
            let text = json["text"] as? String else {
                return nil
        }

        self.name = name
        self.handle = handle
        self.text = text
    }
    
    func header() -> String {
        return "\(name) - \(handle)"
    }

    func content() -> String {
        return text
    }

    func tweetImage() -> UIImage? {
        return nil
    }

}
