//
//  MockDisplayInfoCVWireFrame.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/24/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import Foundation
@testable import MyPersonalCV

class MockDisplayInfoCVWireFrame: DisplayInfoCVWireFrameProtocol {
  var presentDisplayInfoCVModuleCalled: Bool = false
  var presentSelectedCalled: Bool = false

  func presentDisplayInfoCVModule() {
    presentDisplayInfoCVModuleCalled = true
  }

  func presentSelected(_ section: Section) {
    presentSelectedCalled = true
  }
}
