//
//  Configuration.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/22/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import Foundation

enum Configuration {
  enum Error: Swift.Error {
    case missingKey, invalidValue
  }

  /// Search and return the value for a specific key in the main bundle.
  ///
  /// - Parameter key: the key defined in plist file
  /// - Returns: a value stored in config
  /// - Throws: Error when we can't get the value from the plist file
  static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
    guard let object = Bundle.main.object(forInfoDictionaryKey:key) else {
      throw Error.missingKey
    }

    switch object {
    case let value as T:
      return value
    case let string as String:
      guard let value = T(string) else { fallthrough }
      return value
    default:
      throw Error.invalidValue
    }
  }
}
