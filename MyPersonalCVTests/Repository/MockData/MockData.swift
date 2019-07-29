//
//  MockData.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/24/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import Foundation

enum MockData: String, RawRepresentable {
  case successData = "successData"
  case wrongData = "wrongFormatData"
}

/// Struct for json resources used in unit test
struct JSONConfig {
  static let jsonFile = "json"
}
