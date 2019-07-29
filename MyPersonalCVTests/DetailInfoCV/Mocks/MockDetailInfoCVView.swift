//
//  MockDetailInfoCVView.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/25/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit
@testable import MyPersonalCV

class MockDetailInfoCVView: UIViewController {
  var presenter: DetailInfoCVPresenterProtocol?

  var loadImageDataCalled: Bool = false
  var showErrorCalled: Bool = false

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension MockDetailInfoCVView: DetailInfoCVViewProtocol {
  static var storyboardFileName: String = "Test"
  
  func loadImageData(_ data: UIImage) {
    loadImageDataCalled = true
  }
  
  func showError(title: String, message: String) {
    showErrorCalled = true
  }
}
