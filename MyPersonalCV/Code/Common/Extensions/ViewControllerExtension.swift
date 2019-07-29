//
//  ViewControllerExtension.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit


/// Protocol to describe the two main attributes that a ViewController must have to instantiate
protocol LoadableViewProtocol: class {
  static var storyboardFileName: String { get }
  static var storyboardID: String { get }
}

extension LoadableViewProtocol {
  static var storyboardID: String {
    return String(describing: self)
  }
}

extension LoadableViewProtocol where Self: UIViewController {
  // MARK: - Public methods

  /// Instanciate and returns a viewController using storyboardFileName and storyboardID
  static func instantiate() -> Self {
    guard let viewController = UIStoryboard.instantiateViewController(with: storyboardID, from: storyboardFileName) as? Self else {
      fatalError("The viewController '\(storyboardID)' of '\(storyboardFileName)' is not of class '\(self)'")
    }
    return viewController
  }
}
