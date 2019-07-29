//
//  MockDetailInfoCVAPIDataManager.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/30/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit
@testable import MyPersonalCV

class MockDetailInfoCVAPIDataManager: DetailInfoCVAPIDataManagerInputProtocol {
  var completionSuccess: Bool = true
  var fetchImageDataCalled: Bool = false

  func fetchImageData(from url: String, completion: @escaping (APIResult<UIImage, APIError>) -> Void) {
    fetchImageDataCalled = true
    if completionSuccess {
      let dummyImage = UIImage()
      completion(.success(dummyImage))
    } else {
      completion(.failure(.badResponse))
    }
  }
}
