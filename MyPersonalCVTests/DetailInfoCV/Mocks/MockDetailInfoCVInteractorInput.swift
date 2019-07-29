//
//  MockDetailInfoCVInteractorInput.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/25/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import Foundation
@testable import MyPersonalCV

class MockDetailInfoCVInteractorInput: DetailInfoCVInteractorInputProtocol {
  var presenter: DetailInfoCVInteractorOutputProtocol?
  var dataManager: DetailInfoCVAPIDataManagerInputProtocol?

  var fetchImageDataCalled: Bool = false

  func fetchImageData(from url: String) {
    fetchImageDataCalled = true
  }
}
