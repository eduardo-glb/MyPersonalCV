//
//  DetailInfoCVPresenter.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/23/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit

class DetailInfoCVPresenter: DetailInfoCVPresenterProtocol {

  weak var view: DetailInfoCVViewProtocol?
  var interactor: DetailInfoCVInteractorInputProtocol?
  var wireFrame: DetailInfoCVWireFrameProtocol?

  private let localizable = AppLocalizable()
  var section: Section?

  init(section: Section) {
    self.section = section
  }

  func viewReady() {
    if let imageURL = section?.imageURL {
      self.interactor?.fetchImageData(from: imageURL)
    }
  }

  func getTitle() -> String {
    return section?.title ?? ""
  }

  func getDescription() -> String {
    return section?.description ?? ""
  }
}

extension DetailInfoCVPresenter: DetailInfoCVInteractorOutputProtocol {
  func loadImageData(_ data: UIImage) {
    view?.loadImageData(data)
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
