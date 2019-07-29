//
//  MockDeatilInfoCVPresenter.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/25/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit
@testable import MyPersonalCV

class MockDetailInfoCVPresenter: DetailInfoCVPresenterProtocol, DetailInfoCVInteractorOutputProtocol {
  var view: DetailInfoCVViewProtocol?
  var interactor: DetailInfoCVInteractorInputProtocol?
  var wireFrame: DetailInfoCVWireFrameProtocol?

  var viewReadyCalled: Bool = false
  var titleCalled: String = "testTitle"
  var descriptionCalled: String = "descriptionTest"
  var loadImageDataCalled: Bool = false
  var handleErrorCalled: Bool = false

  func viewReady() {
    viewReadyCalled = true
  }

  func getTitle() -> String {
    return titleCalled
  }

  func getDescription() -> String {
    return descriptionCalled
  }

  func loadImageData(_ data: UIImage) {
    loadImageDataCalled = true
  }

  func handleError(_ error: APIError) {
    handleErrorCalled = true
  }
}
