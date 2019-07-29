//
//  MyPersonalCVUITests.swift
//  MyPersonalCVUITests
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import XCTest

class MyPersonalCVUITests: XCTestCase {

  // MARK: - Attributes
  let app = XCUIApplication()

  override func setUp() {
    continueAfterFailure = false
    app.launchArguments.append("--UITests")
    app.launch()
    let label = app.staticTexts["Skills"]
    while !label.exists {
      sleep(1)
    }
  }

  override func tearDown() {
  }

  /// Take an screenshot and save as attachment
  func takeScreenshot() {
    app.windows.firstMatch.screenshot()
    let screenshot = app.windows.firstMatch.screenshot()
    let attachment = XCTAttachment(screenshot: screenshot)
    attachment.lifetime = .keepAlways
    add(attachment)
  }

  // MARK: - Tests methods

  /// Test header's name of sections
  func testHeaderSections() {
    XCTAssertTrue(app.staticTexts["Skills"].exists)
    XCTAssertTrue(app.staticTexts["Experience"].exists)
    XCTAssertTrue(app.staticTexts["Contact"].exists)
  }

  /// Test tableview's number of sections
  func testNumberOfSections() {
    let numberOfCells = app.collectionViews.cells.count
    XCTAssertEqual(numberOfCells, 3)
  }

  /// Test tableview's pull to refresh functionality
  func testPullToRefresh() {
    let firstCell = app.staticTexts["Skills"]
    let start = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
    let finish = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 12))
    start.press(forDuration: 0.1, thenDragTo: finish)
  }

  /// Test skills detail
  func testSkillsDetail() {
    let skillsCell = app.staticTexts["Skills"]
    XCTAssertTrue(skillsCell.exists)
    takeScreenshot()
    skillsCell.tap()
    let backButton = app.navigationBars.buttons.element(boundBy: 0)
    XCTAssertTrue(backButton.exists)
    takeScreenshot()
    backButton.tap()
  }

  /// Test experience detail and device orientation
  func testExperienceDetailChangeOrientation() {
    let experienceCell = app.staticTexts["Experience"]
    XCTAssertTrue(experienceCell.exists)
    takeScreenshot()
    experienceCell.tap()
    XCUIDevice.shared.orientation = .landscapeLeft
    takeScreenshot()
    XCUIDevice.shared.orientation = .portrait
    let backButton = app.navigationBars.buttons.element(boundBy: 0)
    XCTAssertTrue(backButton.exists)
    backButton.tap()
  }
}
