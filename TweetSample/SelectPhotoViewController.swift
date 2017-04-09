//
//  SelectPhotoViewController.swift
//  TweetSample
//
//  Created by Francois Courville on 2017-01-13.
//  Copyright © 2017 Francois Courville. All rights reserved.
//

import Foundation
import UIKit

protocol SelectPhotoViewControllerDelegate {
    func didSelect(photo: UIImage?, in controller: SelectPhotoViewController)
}

class SelectPhotoViewController: UIViewController {
    var delegate: SelectPhotoViewControllerDelegate?
    var selectedPhoto: UIImage? {
        didSet {
            if let photo = selectedPhoto {
                displaySelectedPhoto(photo: photo)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(handleNextButtonTapped))

        setupView()
        createConstraints()
    }

    func setupView() {
        view.backgroundColor = .white

        view.addSubview(showImagePickerButton)
    }

    func createConstraints() {
        NSLayoutConstraint.activate([
            showImagePickerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showImagePickerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showImagePickerButton.heightAnchor.constraint(equalToConstant: 150),
            showImagePickerButton.widthAnchor.constraint(equalToConstant: 150),
            ])
    }

    func handleNextButtonTapped() {
        delegate?.didSelect(photo: selectedPhoto, in: self)
    }

    func handleShowImagePickerButtonPressed() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            return
        }

        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true)
    }

    func displaySelectedPhoto(photo: UIImage) {
        showImagePickerButton.setTitle("", for: .normal)
        showImagePickerButton.setBackgroundImage(photo, for: .normal)
    }
        
    let showImagePickerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Display\nImage Picker", for: .normal)
        button.setTitleColor(.appCharcoal, for: .normal)
        button.titleLabel?.font = UIFont.montserratBold(size: 14)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center

        button.layer.borderColor = UIColor.appCharcoal.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true

        button.addTarget(self, action: #selector(handleShowImagePickerButtonPressed), for: .touchUpInside)
        
        return button
    }()
}

extension SelectPhotoViewController : UINavigationControllerDelegate {}
extension SelectPhotoViewController : UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info["UIImagePickerControllerOriginalImage"] as? UIImage else {
            dismiss(animated: true)
            return
        }

        selectedPhoto = image
        dismiss(animated: true)
    }
}

