//
//  RepositoryTests.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/24/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import XCTest
@testable import MyPersonalCV

class RepositoryTests: XCTestCase {

  override func setUp() {
  }

  override func tearDown() {
  }

  func testMyCVSuccessResponse() {
    let expectation = XCTestExpectation(description: NSLocalizedString("Verify JSON response", comment: ""))

    let completion: (APIResult<InfoCVModel,APIError>) -> Void = { (result) in
      switch result {
      case .success(_):
        expectation.fulfill()
      case .failure(_):
        XCTFail()
      }
    }

    let mockSession = MockRepositorySession()
    mockSession.error = nil
    mockSession.data = mockSession.getDataFrom(resource: .successData)
    mockSession.response = mockSession.getSuccessResponse()

    let repository = Repository(session: mockSession)
    repository.callService(url: Endpoints.GetCVInfo.fetchSuccess.url, completion: completion)

    wait(for: [expectation], timeout: 3.0)
  }

  func testMyCVFailResponseIntegrity() {
    let expectation = XCTestExpectation(description: NSLocalizedString("Verify JSON integrity", comment: ""))

    let completion: (APIResult<InfoCVModel,APIError>) -> Void = { (result) in
      switch result {
      case .success(_):
        XCTFail()
      case .failure(_):
        expectation.fulfill()
      }
    }

    let mockSession = MockRepositorySession()
    mockSession.error = nil
    mockSession.data = mockSession.getDataFrom(resource: .wrongData)
    mockSession.response = mockSession.getSuccessResponse()

    let repository = Repository(session: mockSession)
    repository.callService(url: Endpoints.GetCVInfo.fetchFail.url, completion: completion)

    wait(for: [expectation], timeout: 3.0)
  }

  func testMyCVSections() {
    let expectation = XCTestExpectation(description: NSLocalizedString("Verify sections from JSON response", comment: ""))

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

    let mockSession = MockRepositorySession()
    mockSession.error = nil
    mockSession.data = mockSession.getDataFrom(resource: .successData)
    mockSession.response = mockSession.getSuccessResponse()

    let repository = Repository(session: mockSession)
    repository.callService(url: Endpoints.GetCVInfo.fetchSuccess.url, completion: completion)

    wait(for: [expectation], timeout: 3.0)
  }
}
