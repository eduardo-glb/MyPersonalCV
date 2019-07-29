//
//  DisplayInfoCVViewTests.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/25/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import XCTest
@testable import MyPersonalCV

class DisplayInfoCVViewTests: XCTestCase {

  var view: DisplayInfoCVViewController = DisplayInfoCVViewController.instantiate()

  var presenter: MockDisplayInfoCVPresenter = MockDisplayInfoCVPresenter()

  override func setUp() {
    super.setUp()
    view.presenter = presenter
  }

  override func tearDown() {
    super.tearDown()
  }

  func testViewIsNotNil() {
    XCTAssertNotNil(view, "Should not be nil the instance of DisplacyInfoCVViewController")
  }

  func testViewDidLoadCallViewReady() {
    view.viewDidLoad()
    XCTAssertTrue(presenter.viewReadyCalled, "Should call viewReady method.")
  }

  func testShowErrorMethod() {
    view.showError(title: "ErrorTitle", message: "ErrorMessage")
  }
}
