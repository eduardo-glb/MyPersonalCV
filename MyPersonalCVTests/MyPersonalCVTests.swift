//
//  MyPersonalCVTests.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import XCTest
@testable import MyPersonalCV

class MyPersonalCVTests: XCTestCase {

  var appDelegate: AppDelegate = AppDelegate();
  var window: UIWindow? = UIWindow()

  override func setUp() {
    super.setUp()
    appDelegate.window = window
  }

  override func tearDown() {
    super.tearDown()
    window = nil
  }

  func testThatDidFinishLaunchingWithOptionsReturnsTrue() {
    XCTAssertTrue(appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil), "Should return true from didFinishLaunchingWithOptions")
  }

  func testConfigurationValidValue() {
    let expectation = XCTestExpectation(description: NSLocalizedString("Verify plist config", comment: ""))

    do {
      let _: String = try Configuration.value(for: Constants.plistConfig.apiBaseURL)
      expectation.fulfill()
    } catch {
      XCTFail()
    }

    wait(for: [expectation], timeout: 3.0)
  }

  func testConfigurationInvalidValue() {
    let expectation = XCTestExpectation(description: NSLocalizedString("Verify plist config", comment: ""))

    do {
      let _: String = try Configuration.value(for: "dummyValue")
      XCTFail()
    } catch {
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 3.0)
  }

  func testTitleLocalizable() {
    let localizables = AppLocalizable()
    let expectationTitle = "CV info"
    let title = localizables.appTitle

    XCTAssertEqual(title, expectationTitle, "The titles must be equals.")
  }
}
