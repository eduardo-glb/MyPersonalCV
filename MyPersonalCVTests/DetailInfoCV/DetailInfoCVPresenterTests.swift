//
//  DetailInfoCVPresenterTests.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/25/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import XCTest
@testable import MyPersonalCV

class DetailInfoCVPresenterTests: XCTestCase {
  var presenter: DetailInfoCVPresenter = DetailInfoCVPresenter(section: Section(title: "title", description: "description", imageURL: "imageURL"))

  var view: MockDetailInfoCVView = MockDetailInfoCVView()
  var interactor: MockDetailInfoCVInteractorInput = MockDetailInfoCVInteractorInput()
  var wireFrame: MockDetailInfoCVWireFrame = MockDetailInfoCVWireFrame()

  override func setUp() {
    super.setUp()
    presenter.view = view
    presenter.interactor = interactor
    presenter.wireFrame = wireFrame
  }

  override func tearDown() {
    super.tearDown()
  }

  func testViewReadyCallFetchImageData() {
    presenter.viewReady()
    XCTAssertTrue(interactor.fetchImageDataCalled, "Should call fetchImageData method.")
  }

  func testSelectSectionCallPresentSelection() {
    let expectedSection = Section(title: "title", description: "description", imageURL: "imageURL")
    let title = presenter.getTitle()
    XCTAssertEqual(title, expectedSection.title, "Should be must equal titles.")
  }

  func testloadInfoCVDataCallShowError() {
    let expectedSection = Section(title: "title", description: "description", imageURL: "imageURL")
    let description = presenter.getDescription()
    XCTAssertEqual(description, expectedSection.description, "Should be must equal descriptions.")
  }

  func testloadInfoCVDataCallLoadInfoCVData() {
    let dummyImage = UIImage()
    presenter.loadImageData(dummyImage)
    XCTAssertTrue(view.loadImageDataCalled, "Should call loadImageData method.")
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
