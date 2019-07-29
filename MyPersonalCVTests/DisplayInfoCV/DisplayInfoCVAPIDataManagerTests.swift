//
//  DisplayInfoCVAPIDataManagerTests.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/30/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import XCTest
@testable import MyPersonalCV

class DisplayInfoCVAPIDataManagerTests: XCTestCase {
  var dataManager: DisplayInfoCVAPIDataManagerInputProtocol = DisplayInfoCVAPIDataManager()

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func testFetchInfoCVDataSuccess() {
    let expectation = XCTestExpectation(description: NSLocalizedString("Verify JSON response", comment: ""))

    let completion: (APIResult<InfoCVModel,APIError>) -> Void = { (result) in
      switch result {
      case .success(_):
        expectation.fulfill()
      case .failure(_):
        XCTFail()
      }
    }

    dataManager.fetchInfoCVData(completion: completion)
    wait(for: [expectation], timeout: 3.0)
  }

  func testInfoCVDataSections() {
    let expectation = XCTestExpectation(description: NSLocalizedString("Verify JSON response", comment: ""))

    let completion: (APIResult<InfoCVModel,APIError>) -> Void = { (result) in
      switch result {
      case .success(let myCVInfo):
        if myCVInfo.sections.count == 3 {
          expectation.fulfill() }
        else {
          XCTFail()
        }
      case .failure(_):
        XCTFail()
      }
    }

    dataManager.fetchInfoCVData(completion: completion)
    wait(for: [expectation], timeout: 3.0)
  }
}
