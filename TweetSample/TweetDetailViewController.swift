//
//  TweetDetailViewController.swift
//  TweetSample
//
//  Created by Francois Courville on 2017-01-13.
//  Copyright © 2017 Francois Courville. All rights reserved.
//

import Foundation
import UIKit

class TweetDetailViewController: UIViewController {
    let selectedTweet: TweetDisplayable

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.montserrat(size: 18.0)
        label.textColor = .appCharcoal

        return label
    }()

    let tweetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.layer.borderColor = UIColor.appCharcoal.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true

        return imageView
    }()

    let contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.montserrat(size: 14.0)
        label.textColor = .appCharcoal
        label.numberOfLines = 0
        
        return label
    }()

    init(tweet: TweetDisplayable) {
        self.selectedTweet = tweet

        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        createConstraints()
    }

    func setupView() {
        view.backgroundColor = UIColor.white
        view.addSubview(titleLabel)
        view.addSubview(contentLabel)
        view.addSubview(tweetImageView)
        
        titleLabel.text = selectedTweet.header()
        contentLabel.text = selectedTweet.content()

        if let image = selectedTweet.tweetImage() {
            tweetImageView.isHidden = false
            tweetImageView.image = image
        } else {
            tweetImageView.isHidden = true
            tweetImageView.image = nil
        }
    }

    func createConstraints() {
        edgesForExtendedLayout = []

        NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
                titleLabel.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
                titleLabel.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),

                contentLabel.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
                contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
                contentLabel.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),

                tweetImageView.heightAnchor.constraint(equalToConstant: 150),
                tweetImageView.widthAnchor.constraint(equalToConstant: 150),
                tweetImageView.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 10),
                tweetImageView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
