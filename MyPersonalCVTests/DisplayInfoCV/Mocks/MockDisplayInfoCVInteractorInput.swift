//
//  MockDisplayInfoCVInteractorInput.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/24/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import Foundation
@testable import MyPersonalCV

class MockDisplayInfoCVInteractorInput: DisplayInfoCVInteractorInputProtocol {
  var presenter: DisplayInfoCVInteractorOutputProtocol?
  var dataManager: DisplayInfoCVAPIDataManagerInputProtocol?

  var fetchInfoCVDataCalled: Bool = false

  func fetchInfoCVData() {
    fetchInfoCVDataCalled = true
  }
}
