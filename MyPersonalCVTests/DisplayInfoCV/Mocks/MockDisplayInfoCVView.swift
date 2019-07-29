//
//  MockDisplayInfoCVView.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/24/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit
@testable import MyPersonalCV

class MockDisplayInfoCVView: UIViewController {
  var presenter: DisplayInfoCVPresenterProtocol?

  var loadInfoCVDataCalled: Bool = false
  var showErrorCalled: Bool = false

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension MockDisplayInfoCVView: DisplayInfoCVViewProtocol {
  static var storyboardFileName: String = "Test"

  func loadInfoCVData(_ data: InfoCVModel) {
    loadInfoCVDataCalled = true
  }

  func showError(title: String, message: String) {
    showErrorCalled = true
  }
}
