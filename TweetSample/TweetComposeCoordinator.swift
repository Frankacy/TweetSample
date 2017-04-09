//
//  TweetComposeCoordinator.swift
//  TweetSample
//
//  Created by Francois Courville on 2017-01-13.
//  Copyright © 2017 Francois Courville. All rights reserved.
//

import Foundation
import UIKit

protocol TweetComposeCoordinatorDelegate {
    func didFinishComposing(newTweet: NewTweet, in coordinator: TweetComposeCoordinator)
}

class TweetComposeCoordinator {
    var navigationController = UINavigationController()

    var newTweet: NewTweet = NewTweet()
    var delegate: TweetComposeCoordinatorDelegate?

    init() {
        navigationController.viewControllers = [ firstViewController() ]
    }

    func firstViewController() -> UIViewController {
        let composeController = ComposeTextViewController()
        composeController.delegate = self
        composeController.navigationItem.title = "Compose"

        return composeController
    }

    fileprivate func pushSelectImageViewController() {
        let photoController = SelectPhotoViewController()
        photoController.delegate = self
        photoController.navigationItem.title = "Photo"

        navigationController.pushViewController(photoController, animated: true)
    }

    fileprivate func pushSelectHashtagsViewController() {
        let hashtagsController = SelectHashtagsViewController(dataSource: HashtagsDataSource())
        hashtagsController.delegate = self
        hashtagsController.navigationItem.title = "Hashags"
        
        navigationController.pushViewController(hashtagsController, animated: true)
    }

    fileprivate func pushConfirmViewController() {
        let confirmViewController = TweetDetailViewController(tweet: newTweet)
        let confirmButton = UIBarButtonItem(title: "Confirm", style: .plain, target: self, action: #selector(completeTweetFlow))
        confirmViewController.navigationItem.rightBarButtonItem = confirmButton
        confirmViewController.navigationItem.title = "Your new Tweet!"

        navigationController.pushViewController(confirmViewController, animated: true)
    }

    @objc fileprivate func completeTweetFlow() {
        delegate?.didFinishComposing(newTweet: newTweet, in: self)
    }
}

extension TweetComposeCoordinator: ComposeTextViewControllerDelegate {
    func didFinishComposing(text: String, in controller: ComposeTextViewController) {
        newTweet.text = text
        pushSelectImageViewController()
    }
}

extension TweetComposeCoordinator: SelectPhotoViewControllerDelegate {
    func didSelect(photo: UIImage?, in controller: SelectPhotoViewController) {
        newTweet.image = photo;
        pushSelectHashtagsViewController()
    }
}

extension TweetComposeCoordinator: SelectHashtagsViewControllerDelegate {
    func didSelect(hashtags: [String], in controller: SelectHashtagsViewController) {
        newTweet.hashtags = hashtags
        pushConfirmViewController()
//        completeTweetFlow()
    }
}

