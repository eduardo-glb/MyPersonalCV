//
//  DisplayInfoCVProtocols.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit

protocol DisplayInfoCVViewProtocol: LoadableViewProtocol {
  var presenter: DisplayInfoCVPresenterProtocol? { get set }
  // MARK: Methods for communication PRESENTER -> VIEW

  /// Load InfoCVModel data feched by service.
  ///
  /// - Parameter data: a valid InfoCVModel
  func loadInfoCVData(_ data: InfoCVModel)

  /// Present a custom error alert with title and message.
  ///
  /// - Parameters:
  ///   - title: error title
  ///   - message: error description
  func showError(title: String, message: String)
}

protocol DisplayInfoCVPresenterProtocol: class {
  var view: DisplayInfoCVViewProtocol? { get set }
  var interactor: DisplayInfoCVInteractorInputProtocol? { get set }
  var wireFrame: DisplayInfoCVWireFrameProtocol? { get set }
  // MARK: Methods for communication VIEW -> PRESENTER

  /// Inform that the view is ready and loaded.
  func viewReady()

  /// Inform that the user select a specific section.
  ///
  /// - Parameter section: a valid section in the table
  func select(_ section: Section)
}

protocol DisplayInfoCVWireFrameProtocol: class {
  // MARK: Methods for communication PRESENTER -> WIREFRAME

  /// Present DisplayCV module.
  func presentDisplayInfoCVModule()

  /// Present a selected section.
  ///
  /// - Parameter section: a valid section
  func presentSelected(_ section: Section)
}

protocol DisplayInfoCVInteractorOutputProtocol: class {
  // MARK: Methods for communication INTERACTOR -> PRESENTER

  /// Load InfoCVModel data feched by service.
  ///
  /// - Parameter data: a valid InfoCVModel
  func loadInfoCVData(_ data: InfoCVModel)

  /// Handle an especific APIError.
  ///
  /// - Parameter error: an especific APIError
  func handleError(_ error: APIError)
}

protocol DisplayInfoCVInteractorInputProtocol: class {
  var presenter: DisplayInfoCVInteractorOutputProtocol? { get set }
  var dataManager: DisplayInfoCVAPIDataManagerInputProtocol? { get set }
  // MARK: Methods for communication PRESENTER -> INTERACTOR

  /// Order to fetch InfoCV data.
  func fetchInfoCVData()
}

protocol DisplayInfoCVAPIDataManagerInputProtocol: class {
  // MARK: Methods for communication INTERACTOR -> APIDATAMANAGER

  /// Fetch InfoCV data calling a service.
  ///
  /// - Parameter completion: a closure with InfoCVModel reponse for call backs
  func fetchInfoCVData(completion: @escaping (APIResult<InfoCVModel,APIError>) -> Void)
}
