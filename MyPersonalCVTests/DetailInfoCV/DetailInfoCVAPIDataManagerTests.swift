//
//  DetailInfoCVAPIDataManagerTests.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/30/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import XCTest
@testable import MyPersonalCV

class DetailInfoCVAPIDataManagerTests: XCTestCase {
  var dataManager: DetailInfoCVAPIDataManagerInputProtocol = DetailInfoCVAPIDataManager()

  override func setUp() {
    super.setUp()
  }

  override func tearDown() {
    super.tearDown()
  }

  func testFetchImageSuccess() {
    let expectation = XCTestExpectation(description: NSLocalizedString("Verify JSON response", comment: ""))

    let completion: (APIResult<UIImage,APIError>) -> Void = { (result) in
      switch result {
      case .success(_):
        expectation.fulfill()
      case .failure(_):
        XCTFail()
      }
    }

    let imageURL = "https://i.postimg.cc/wMfpz4Tx/Experience.png"
    dataManager.fetchImageData(from: imageURL, completion: completion)
    wait(for: [expectation], timeout: 3.0)
  }

  func testFetchImageFail() {
    let expectation = XCTestExpectation(description: NSLocalizedString("Verify JSON response", comment: ""))

    let completion: (APIResult<UIImage,APIError>) -> Void = { (result) in
      switch result {
      case .success(_):
        XCTFail()
      case .failure(_):
        expectation.fulfill()
      }
    }

    let imageURL = "badURL"
    dataManager.fetchImageData(from: imageURL, completion: completion)
    wait(for: [expectation], timeout: 3.0)
  }
}
