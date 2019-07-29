//
//  DisplayInfoCVAPIDataManager.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import Foundation

class DisplayInfoCVAPIDataManager: DisplayInfoCVAPIDataManagerInputProtocol {
  private lazy var repository: Repository = Repository()

  init() {
  }

  func fetchInfoCVData(completion: @escaping (APIResult<InfoCVModel,APIError>) -> Void) {
    repository.callService(url: Endpoints.GetCVInfo.fetchSuccess.url,
                           completion: completion)
  }
}
