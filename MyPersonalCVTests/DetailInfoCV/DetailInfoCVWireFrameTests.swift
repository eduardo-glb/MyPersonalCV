//
//  DetailInfoCVWireFrameTests.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/30/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import XCTest
@testable import MyPersonalCV

class DetailInfoCVWireFrameTests: XCTestCase {
  var wireFrame: DetailInfoCVWireFrameProtocol = DetailInfoCVWireFrame()

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func testPresentDetailInfoCVModule() {
    let dummySection = Section(title: "title", description: "description", imageURL: "imageURL")
    wireFrame.presentDetailInfoCVModule(with: dummySection)
  }
}
