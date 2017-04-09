//
//  TweetListDataSource.swift
//  TweetSample
//
//  Created by Francois Courville on 2017-01-12.
//  Copyright © 2017 Francois Courville. All rights reserved.
//

import Foundation
import UIKit

class TweetListDataSource : NSObject, UITableViewDataSource {
    var tweets: [Tweet] = []

    func loadTweets() {
        guard let path = Bundle.main.url(forResource: "timeline", withExtension: "json") else {
            return
        }

        do {
            let jsonData = try Data(contentsOf: path)
            let entries = try JSONSerialization.jsonObject(with: jsonData, options: [])
            let tweetJson = entries as! [[String: Any]]
            tweets = tweetJson.flatMap({
                return Tweet(json: $0)
            })
        } catch {
            return
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as? TweetCell
        let tweet = tweets[indexPath.row]
        cell?.update(with: tweet)

        return cell!
    }
}
