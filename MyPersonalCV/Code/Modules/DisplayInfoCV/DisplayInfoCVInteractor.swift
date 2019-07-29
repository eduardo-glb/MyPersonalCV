//
//  DisplayInfoCVInteractor.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import Foundation

class DisplayInfoCVInteractor: DisplayInfoCVInteractorInputProtocol {

  weak var presenter: DisplayInfoCVInteractorOutputProtocol?
  var dataManager: DisplayInfoCVAPIDataManagerInputProtocol?

  init() { }

  func fetchInfoCVData() {
    dataManager?.fetchInfoCVData(completion: { [unowned self] (result) in
      switch result {
      case .success(let infoCV):
        self.presenter?.loadInfoCVData(infoCV)
      case .failure(let error):
        self.presenter?.handleError(error)
      }
    })
  }
}
