//
//  MockDisplayInfoCVPresenter.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/25/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import Foundation
@testable import MyPersonalCV

class MockDisplayInfoCVPresenter: DisplayInfoCVPresenterProtocol, DisplayInfoCVInteractorOutputProtocol {

  var view: DisplayInfoCVViewProtocol?
  var interactor: DisplayInfoCVInteractorInputProtocol?
  var wireFrame: DisplayInfoCVWireFrameProtocol?

  var viewReadyCalled: Bool = false
  var selectSectionCalled: Bool = false
  var loadInfoCVDataCalled: Bool = false
  var handleErrorCalled: Bool = false

  func viewReady() {
    viewReadyCalled = true
  }

  func select(_ section: Section) {
    selectSectionCalled = true
  }

  func loadInfoCVData(_ data: InfoCVModel) {
    loadInfoCVDataCalled = true
  }

  func handleError(_ error: APIError) {
    handleErrorCalled = true
  }
}
