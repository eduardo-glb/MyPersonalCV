//
//  DisplayInfoCVPresenter.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit

class DisplayInfoCVPresenter: DisplayInfoCVPresenterProtocol {

  weak var view: DisplayInfoCVViewProtocol?
  var interactor: DisplayInfoCVInteractorInputProtocol?
  var wireFrame: DisplayInfoCVWireFrameProtocol?

  private let localizable = AppLocalizable()

  init() { }

  func viewReady() {
    self.interactor?.fetchInfoCVData()
  }

  func select(_ section: Section) {
    self.wireFrame?.presentSelected(section)
  }
}

extension DisplayInfoCVPresenter: DisplayInfoCVInteractorOutputProtocol {
  func loadInfoCVData(_ data: InfoCVModel) {
    if data.sections.isEmpty {
      view?.showError(title: localizable.errorTitle, message: localizable.errorMsgEmptySections)
    } else {
      view?.loadInfoCVData(data)
    }
  }

  func handleError(_ error: APIError) {
    var message = localizable.errorMsgDefault
    switch error {
    case .badResponse:
      message = localizable.errorMsgBadResponse
    case .badURL:
      message = localizable.errorMsgBadURL
    case .noNetworkConnection:
      message = localizable.errorMsgNoConnection
    case .timeout:
      message = localizable.errorMsgTimeout
    case .unkown(let msg):
      message = msg
    }
    view?.showError(title: localizable.errorTitle, message: message)
  }
}
