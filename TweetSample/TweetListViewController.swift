//
//  TweetListViewController.swift
//  TweetSample
//
//  Created by Francois Courville on 2017-01-12.
//  Copyright © 2017 Francois Courville. All rights reserved.
//

import Foundation
import UIKit

protocol TweetListViewControllerDelegate {
    func didSelect(tweet: Tweet, in controller: TweetListViewController)
}

class TweetListViewController : UITableViewController {
    var delegate: TweetListViewControllerDelegate?
    let dataSource: TweetListDataSource

    init(dataSource: TweetListDataSource) {
        self.dataSource = dataSource

        super.init(style: .plain)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource.loadTweets()
        
        tableView.dataSource = self.dataSource
        tableView.register(TweetCell.self, forCellReuseIdentifier: "tweetCell")
        tableView.estimatedRowHeight = 75
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTweet = self.dataSource.tweets[indexPath.row]
        delegate?.didSelect(tweet: selectedTweet, in: self)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
