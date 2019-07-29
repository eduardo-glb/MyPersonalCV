//
//  DetailInfoCVInteractorTests.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/30/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import XCTest
@testable import MyPersonalCV

class DetailInfoCVInteractorTests: XCTestCase {
  var interactor: DetailInfoCVInteractorInputProtocol = DetailInfoCVInteractor()

  var presenter: MockDetailInfoCVPresenter = MockDetailInfoCVPresenter()
  var dataManager: MockDetailInfoCVAPIDataManager = MockDetailInfoCVAPIDataManager()

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
    interactor.fetchImageData(from: "dummyURL")
    XCTAssertTrue(presenter.loadImageDataCalled, "Should call loadImageData method.")
  }

  func testFetchInfoCVDataCallHandleError() {
    dataManager.completionSuccess = false
    interactor.fetchImageData(from: "dummyURL")
    XCTAssertTrue(presenter.handleErrorCalled, "Should call handleError method.")
  }
}
