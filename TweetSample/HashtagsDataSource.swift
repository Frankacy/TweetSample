//
//  HashtagsDataSource.swift
//  TweetSample
//
//  Created by Francois Courville on 2017-01-16.
//  Copyright © 2017 Francois Courville. All rights reserved.
//

import Foundation
import UIKit

class HashtagsDataSource : NSObject, UITableViewDataSource {
    let hashtags: [String] = [ "#swift", "#iosDev", "#objc" ]

    func hashtag(at indexPath: IndexPath) -> String {
        return hashtags[indexPath.row]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hashtags.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hashtagCell", for: indexPath)
        let hashtag = hashtags[indexPath.row]

        cell.textLabel?.text = hashtag
        cell.textLabel?.font = UIFont.montserrat(size: 16)
        cell.textLabel?.textColor = .appCharcoal

        return cell
    }
}
