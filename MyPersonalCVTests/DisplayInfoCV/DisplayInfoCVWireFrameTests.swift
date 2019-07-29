//
//  DisplayInfoCVWireFrameTests.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/30/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import XCTest
@testable import MyPersonalCV

class DisplayInfoCVWireFrameTests: XCTestCase {
  var wireFrame: DisplayInfoCVWireFrameProtocol = DisplayInfoCVWireFrame()

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func testPresentDisplayInfoCVModule() {
    wireFrame.presentDisplayInfoCVModule()
  }

  func testPresentSelectedModule() {
    let dummySection = Section(title: "title", description: "description", imageURL: "imageURL")
    wireFrame.presentSelected(dummySection)
  }
}
