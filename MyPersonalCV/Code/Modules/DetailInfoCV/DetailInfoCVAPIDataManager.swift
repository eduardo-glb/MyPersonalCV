//
//  DetailInfoCVAPIDataManager.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/23/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit

class DetailInfoCVAPIDataManager: DetailInfoCVAPIDataManagerInputProtocol {
  private lazy var repository: Repository = Repository()

  init() {
  }

  func fetchImageData(from url: String, completion: @escaping (APIResult<UIImage, APIError>) -> Void) {
    repository.getImage(from: url, completion: completion)
  }
}
