//
//  Constants.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit

struct Constants {
  /// Struct for keys defined in Config file
  struct plistConfig {
    static let apiBaseURL = "API_BASE_URL"
    static let getCVInfoSuccess = "GETCVINFO_SUCCESS"
    static let getCVInfoFail = "GETCVINFO_FAIL"
  }

  /// Struct for request attributes
  struct Request {
    static let defaultTimeoutInterval = 60.0
    static let https = "https://"
  }

  /// Struct for storyboard identifiers
  struct StoryboardIdentifier {
    static let customSplash = "CustomSplash"
    static let displayInfoCV = "DisplayInfoCV"
    static let detailInfoCV = "DetailInfoCV"
  }

  /// Struct for Nib identifiers
  struct NibIdentifier {
    static let informationNib = "DisplayInfoCVViewCell"
  }

  /// Struct for cell identifiers
  struct CellIdentifier {
    static let information = "information_cell"
  }

  /// Struct for default layout definitions
  struct Layout {
    static let defaultWidth = 100
    static let defaultHeight = 100
    static let defaultPosition = CGRect(x: 0, y: 0, width: defaultWidth, height: defaultHeight)
    static let defaultConstant: CGFloat = 8.0
  }
}
