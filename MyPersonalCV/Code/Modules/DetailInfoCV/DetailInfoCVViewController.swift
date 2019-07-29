//
//  DetailInfoCVViewController.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/19/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit

class DetailInfoCVViewController: UIViewController {
  // MARK: - Attributes
  var presenter: DetailInfoCVPresenterProtocol?

  // MARK: - Private attributes
  private let localizable = AppLocalizable()
  private var descriptionImage = UIImageView(frame: Constants.Layout.defaultPosition)
  private var descriptionLabel = UILabel(frame: Constants.Layout.defaultPosition)

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    setupUI()
    presenter?.viewReady()
  }

  // MARK: - Private methods
  private func setupUI() {
    self.title = presenter?.getTitle()
    buildDescriptionView()
  }

  /// Build the elements to show the description
  private func buildDescriptionView() {
    let margins = view.safeAreaLayoutGuide
    descriptionImage.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(descriptionImage)
    descriptionImage.topAnchor.constraint(equalTo: margins.topAnchor,
                                          constant: Constants.Layout.defaultConstant).isActive = true
    descriptionImage.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true

    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.text = presenter?.getDescription()
    descriptionLabel.numberOfLines = 0
    self.view.addSubview(descriptionLabel)
    descriptionLabel.topAnchor.constraint(equalTo: descriptionImage.bottomAnchor,
                                          constant: Constants.Layout.defaultConstant).isActive = true
    descriptionLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor,
                                              constant: Constants.Layout.defaultConstant).isActive = true
    descriptionLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor,
                                               constant: -Constants.Layout.defaultConstant).isActive = true
  }
}

extension DetailInfoCVViewController: DetailInfoCVViewProtocol {
  static var storyboardFileName: String = Constants.StoryboardIdentifier.detailInfoCV

  func loadImageData(_ data: UIImage) {
    descriptionImage.image = data
  }

  func showError(title: String, message: String) {
    let alertController = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: localizable.errorAcceptButton,
                                            style: .cancel,
                                            handler: nil))
    self.present(alertController, animated: true, completion: nil)
  }
}
