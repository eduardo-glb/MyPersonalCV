//
//  UIStoryboardExtension.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit

typealias StoryboardID = String

extension UIStoryboard {

  // MARK: - Public methods

  /// Instanciate and returns a viewController in specific storyboard.
  ///
  /// - Parameters:
  ///   - storyboardID: an identifier string that uniquely identifies the view controller in the storyboard file
  ///   - storyboardFileName: name of the storyboard file
  /// - Returns: The view controller corresponding to the specified identifier string
  class func instantiateViewController(with storyboardID: String, from storyboardFileName: String) -> UIViewController? {
    let storyboard = UIStoryboard(
      name: storyboardFileName,
      bundle: nil
    )

    return storyboard.instantiateViewController(withIdentifier: storyboardID)
  }
}
