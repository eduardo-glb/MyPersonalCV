//
//  MockDetailInfoCVWireFrame.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/25/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import Foundation
@testable import MyPersonalCV

class MockDetailInfoCVWireFrame: DetailInfoCVWireFrameProtocol {
  var presentDetailInfoCVModuleCalled: Bool = false

  func presentDetailInfoCVModule(with section: Section) {
    presentDetailInfoCVModuleCalled = true
  }
}
