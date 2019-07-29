//
//  DetailInfoCVProtocols.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/23/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit

protocol DetailInfoCVViewProtocol: LoadableViewProtocol {
  var presenter: DetailInfoCVPresenterProtocol? { get set }
  // MARK: Methods for communication PRESENTER -> VIEW

  /// Load UIImage data feched by service.
  ///
  /// - Parameter data: a valid UIIMage
  func loadImageData(_ data: UIImage)

  /// Present a custom error alert with title and message.
  ///
  /// - Parameters:
  ///   - title: error title
  ///   - message: error description
  func showError(title: String, message: String)
}

protocol DetailInfoCVPresenterProtocol: class {
  var view: DetailInfoCVViewProtocol? { get set }
  var interactor: DetailInfoCVInteractorInputProtocol? { get set }
  var wireFrame: DetailInfoCVWireFrameProtocol? { get set }
  // MARK: Methods for communication VIEW -> PRESENTER

  /// Inform that the view is ready and loaded.
  func viewReady()
  /// Get the title to display in Detail.
  func getTitle() -> String
  /// Get the description to display in Detail.
  func getDescription() -> String
}

protocol DetailInfoCVWireFrameProtocol: class {
  // MARK: Methods for communication PRESENTER -> WIREFRAME

  /// Present DetailInfoCV module.
  func presentDetailInfoCVModule(with section: Section)
}

protocol DetailInfoCVInteractorOutputProtocol: class {
  // MARK: Methods for communication INTERACTOR -> PRESENTER

  /// Load UIImage data feched by service.
  ///
  /// - Parameter data: a valid UIIMage
  func loadImageData(_ data: UIImage)

  /// Handle an especific APIError.
  ///
  /// - Parameter error: an especific APIError
  func handleError(_ error: APIError)
}

protocol DetailInfoCVInteractorInputProtocol: class {
  var presenter: DetailInfoCVInteractorOutputProtocol? { get set }
  var dataManager: DetailInfoCVAPIDataManagerInputProtocol? { get set }
  // MARK: Methods for communication PRESENTER -> INTERACTOR

  /// Order to fetch Image data.
  func fetchImageData(from url: String)
}

protocol DetailInfoCVAPIDataManagerInputProtocol: class {
  // MARK: Methods for communication INTERACTOR -> APIDATAMANAGER

  /// Fetch Image data calling a service.
  ///
  /// - Parameter completion: a closure with UIImage reponse for call backs
  func fetchImageData(from url: String, completion: @escaping (APIResult<UIImage,APIError>) -> Void)
}
