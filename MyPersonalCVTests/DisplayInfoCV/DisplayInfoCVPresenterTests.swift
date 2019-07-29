//
//  DisplayInfoCVPresenterTests.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/24/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import XCTest
@testable import MyPersonalCV

class DisplayInfoCVPresenterTests: XCTestCase {

  var presenter: DisplayInfoCVPresenter = DisplayInfoCVPresenter()

  var view: MockDisplayInfoCVView = MockDisplayInfoCVView()
  var interactor: MockDisplayInfoCVInteractorInput = MockDisplayInfoCVInteractorInput()
  var wireFrame: MockDisplayInfoCVWireFrame = MockDisplayInfoCVWireFrame()

  override func setUp() {
    super.setUp()
    presenter.view = view
    presenter.interactor = interactor
    presenter.wireFrame = wireFrame
  }

  override func tearDown() {
    super.tearDown()
  }

  func testViewReadyCallFetchInfoCVData() {
    presenter.viewReady()
    XCTAssertTrue(interactor.fetchInfoCVDataCalled, "Should call fetchInfoCVData method.")
  }

  func testSelectSectionCallPresentSelection() {
    let dummySection = Section(title: "title", description: "description", imageURL: "imageURL")
    presenter.select(dummySection)
    XCTAssertTrue(wireFrame.presentSelectedCalled, "Should call presentSelected method.")
  }

  func testloadInfoCVDataCallShowError() {
    let dummyData = InfoCVModel(fullName: "fullname", photoURL: "photoURL", sections: [])
    presenter.loadInfoCVData(dummyData)
    XCTAssertTrue(view.showErrorCalled, "Should call showError method.")
  }

  func testloadInfoCVDataCallLoadInfoCVData() {
    let dummySection = Section(title: "title", description: "description", imageURL: "imageURL")
    let dummyData = InfoCVModel(fullName: "fullname", photoURL: "photoURL", sections: [dummySection])
    presenter.loadInfoCVData(dummyData)
    XCTAssertTrue(view.loadInfoCVDataCalled, "Should call loadInfoCVData method.")
  }

  func testHandleErrorCallShowError() {
    var dummyError: APIError = .badResponse
    presenter.handleError(dummyError)
    XCTAssertTrue(view.showErrorCalled, "Should call showError method.")
    dummyError = .badURL
    presenter.handleError(dummyError)
    XCTAssertTrue(view.showErrorCalled, "Should call showError method.")
    dummyError = .noNetworkConnection
    presenter.handleError(dummyError)
    XCTAssertTrue(view.showErrorCalled, "Should call showError method.")
    dummyError = .timeout
    presenter.handleError(dummyError)
    XCTAssertTrue(view.showErrorCalled, "Should call showError method.")
    dummyError = .unkown("Different error")
    presenter.handleError(dummyError)
    XCTAssertTrue(view.showErrorCalled, "Should call showError method.")
  }
}
