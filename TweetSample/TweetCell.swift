//
//  TweetCell.swift
//  TweetSample
//
//  Created by Francois Courville on 2017-01-12.
//  Copyright © 2017 Francois Courville. All rights reserved.
//

import Foundation
import UIKit

class TweetCell : UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
        setupConstraints()
    }
    
    public func update(with tweet: Tweet) {
        titleLabel.text = "\(tweet.name) - \(tweet.handle)"
        contentLabel.text = tweet.text
    }

    func setupView() {
        contentView.backgroundColor = UIColor.white
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
    }

    func setupConstraints() {
        titleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor).isActive = true

        contentLabel.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor).isActive = true
        contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        contentLabel.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor).isActive = true
        contentLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true
    }

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.montserratBold(size: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .appCharcoal
        return label
    }()

    let contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.montserrat(size: 12.0)
        label.textColor = .appCharcoal
        label.numberOfLines = 0
        return label
    }()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
