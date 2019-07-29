//
//  CustomSplashViewController.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit

/// Custom layout to present when the app is launching
class CustomSplashViewController: UIViewController {
  // MARK: - IBOulets
  @IBOutlet var activityIndicator: UIActivityIndicatorView?
  @IBOutlet var loadingLabel: UILabel?
  @IBOutlet var appTitleLabel: UILabel?
  
  // MARK: - Private attributes
  private let localizable = AppLocalizable()
  private let wireFrame = DisplayInfoCVWireFrame()
  
  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    activityIndicator?.startAnimating()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    activityIndicator?.stopAnimating()
  }

  // MARK: - Private methods
  /// Configure the localizables in the UI
  private func setupUI() {
    loadingLabel?.text = localizable.loadingTitle
    appTitleLabel?.text = localizable.appTitle

    gotoNextScreen()
  }

  /// Wait 1 second and redirect to next module
  private func gotoNextScreen() {
    performTaskAfter(1.0) { [weak self] in
      self?.wireFrame.presentDisplayInfoCVModule()
    }
  }
}

extension CustomSplashViewController: LoadableViewProtocol {
  static var storyboardFileName: String = Constants.StoryboardIdentifier.customSplash
}
