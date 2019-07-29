//
//  DisplayInfoCVInteractorTests.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/30/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import XCTest
@testable import MyPersonalCV

class DisplayInfoCVInteractorTests: XCTestCase {
  var interactor: DisplayInfoCVInteractorInputProtocol = DisplayInfoCVInteractor()

  var presenter: MockDisplayInfoCVPresenter = MockDisplayInfoCVPresenter()
  var dataManager: MockDisplayInfoCVAPIDataManager = MockDisplayInfoCVAPIDataManager()

  override func setUp() {
    super.setUp()
    interactor.presenter = presenter
    interactor.dataManager = dataManager
  }

  override func tearDown() {
    super.tearDown()
  }

  func testFetchInfoCVDataCallLoadinfoCVData() {
    dataManager.completionSuccess = true
    interactor.fetchInfoCVData()
    XCTAssertTrue(presenter.loadInfoCVDataCalled, "Should call loadInfoCVData method.")
  }

  func testFetchInfoCVDataCallHandleError() {
    dataManager.completionSuccess = false
    interactor.fetchInfoCVData()
    XCTAssertTrue(presenter.handleErrorCalled, "Should call handleError method.")
  }
}
