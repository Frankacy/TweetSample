//
//  SelectHashtagsViewController.swift
//  TweetSample
//
//  Created by Francois Courville on 2017-01-13.
//  Copyright © 2017 Francois Courville. All rights reserved.
//

import Foundation
import UIKit

protocol SelectHashtagsViewControllerDelegate {
    func didSelect(hashtags: [String], in controller: SelectHashtagsViewController)
}

class SelectHashtagsViewController: UITableViewController {
    let dataSource: HashtagsDataSource
    var delegate: SelectHashtagsViewControllerDelegate?

    init(dataSource: HashtagsDataSource) {
        self.dataSource = dataSource

        super.init(style: .plain)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self.dataSource
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "hashtagCell")
        tableView.allowsMultipleSelection = true
        tableView.tableFooterView = UIView()
        tableView.reloadData()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(handleNextButtonTapped))
    }

    func handleNextButtonTapped() {
        var selectedHashtags: [String] = []

        if let selectedIndexPaths = tableView.indexPathsForSelectedRows {
            selectedHashtags = selectedIndexPaths.map {
                return dataSource.hashtag(at: $0)
            }
        }

        delegate?.didSelect(hashtags: selectedHashtags, in: self)
    }
}
