//
//  DetailInfoCVInteractor.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/23/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import Foundation

class DetailInfoCVInteractor: DetailInfoCVInteractorInputProtocol {

  weak var presenter: DetailInfoCVInteractorOutputProtocol?
  var dataManager: DetailInfoCVAPIDataManagerInputProtocol?

  init() { }

  func fetchImageData(from url: String) {
    dataManager?.fetchImageData(from: url, completion: { [unowned self] (result) in
      switch result {
      case .success(let image):
        self.presenter?.loadImageData(image)
      case .failure(let error):
        self.presenter?.handleError(error)
      }
    })
  }
}
