//
//  TweetListCoordinator.swift
//  TweetSample
//
//  Created by Francois Courville on 2017-01-12.
//  Copyright © 2017 Francois Courville. All rights reserved.
//

import Foundation
import UIKit

class TweetListCoordinator {
    public var navigationController = UINavigationController()

    init() {
        navigationController.viewControllers = [ firstViewController() ]
    }

    func firstViewController() -> UIViewController {
        let dataSource = TweetListDataSource()
        let tweetList = TweetListViewController(dataSource: dataSource)
        tweetList.navigationItem.title = "Tweets"
        tweetList.delegate = self
        tweetList.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New", style: .plain, target: self, action: #selector(handleNewTweetButtonTapped))

        return tweetList
    }

    func pushTweetDetail(tweet: Tweet) {
        let viewController = TweetDetailViewController(tweet: tweet)
        navigationController.pushViewController(viewController, animated: true)
    }

    @objc func handleNewTweetButtonTapped() {
        let composeTweetCoordinator = TweetComposeCoordinator()
        composeTweetCoordinator.delegate = self
        navigationController.present(composeTweetCoordinator.navigationController, animated: true, completion: nil)
    }
}

extension TweetListCoordinator: TweetListViewControllerDelegate {
    func didSelect(tweet: Tweet, in controller: TweetListViewController) {
        pushTweetDetail(tweet: tweet)
    }
}

extension TweetListCoordinator: TweetComposeCoordinatorDelegate {
    func didFinishComposing(newTweet: NewTweet, in coordinator: TweetComposeCoordinator) {
        coordinator.navigationController.dismiss(animated: true, completion: nil)
        print("This would be a good place to queue up a request for our API: new Tweet with text \"\(newTweet.text)\" and hashtags \(newTweet.hashtags)")
    }
}
