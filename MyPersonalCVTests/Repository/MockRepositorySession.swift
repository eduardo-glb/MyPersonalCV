//
//  MockRepositorySession.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/24/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import XCTest
@testable import MyPersonalCV

class MockRepositorySession: RepositorySession {
  var data: Data?
  var response: URLResponse?
  var error: Error?

  func callService(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    completion(data, response, error)
  }
}

extension MockRepositorySession {

  /// Method to return a success response for unit test
  func getSuccessResponse() -> HTTPURLResponse? {
    let response = HTTPURLResponse(url: URL(fileURLWithPath: ""),
                                   statusCode: 200,
                                   httpVersion: nil,
                                   headerFields: nil)
    return response
  }

  /// Method to return the data from specific resource
  ///
  /// - Parameter resource: enum to define the file to load
  func getDataFrom(resource: MockData) -> Data? {
    return loadJson(for: resource.rawValue)
  }

  /// Return json data readed from file in the main bundle
  ///
  /// - Parameter fileName: resource's name
  private func loadJson(for fileName: String) -> Data? {
    let bundleTest = Bundle(for: MockRepositorySession.self)
    if let url = bundleTest.url(forResource: fileName, withExtension: JSONConfig.jsonFile) {
      do {
        return try Data(contentsOf: url)
      } catch {
        // TODO - Catch error parser
      }
    }
    return nil
  }
}
