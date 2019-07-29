//
//  StringExtension.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import Foundation

var tableName = "AppLocalizables"

extension String {

  // MARK: - Public methods

  /// Returns a localized string, using the AppLocalizables file.
  var localized: String {
    return NSLocalizedString(self, tableName: tableName, bundle: Bundle.main, value: "", comment: "")
  }
}
