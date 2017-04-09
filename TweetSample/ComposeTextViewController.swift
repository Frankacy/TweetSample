//
//  ComposeTextViewController.swift
//  TweetSample
//
//  Created by Francois Courville on 2017-01-13.
//  Copyright © 2017 Francois Courville. All rights reserved.
//

import Foundation
import UIKit

protocol ComposeTextViewControllerDelegate {
    func didFinishComposing(text:String, in controller:ComposeTextViewController)
}

class ComposeTextViewController: UIViewController {
    var delegate: ComposeTextViewControllerDelegate?

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(handleNextButtonTapped))

        setupView()
        createConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        composeTextView.becomeFirstResponder()
    }

    func handleNextButtonTapped() {
        delegate?.didFinishComposing(text: composeTextView.text, in: self)
    }

    func setupView() {
        view.backgroundColor = UIColor.white
        view.addSubview(titleLabel)
        view.addSubview(composeTextView)
    }

    func createConstraints() {
        edgesForExtendedLayout = []

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 12.0),
            titleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),

            composeTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            composeTextView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            composeTextView.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor),
            composeTextView.heightAnchor.constraint(equalToConstant: 150)
            ])
    }
    
    let composeTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.montserrat(size: 14.0)
        textView.layer.cornerRadius = 5
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.appCharcoal.cgColor
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .appCharcoal
        label.font = UIFont.montserratBold(size: 16.0)
        label.text = "Tweet text:"
        
        return label
    }()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
