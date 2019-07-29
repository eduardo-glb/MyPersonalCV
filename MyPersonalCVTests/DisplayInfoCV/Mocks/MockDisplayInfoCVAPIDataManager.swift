//
//  MockDisplayInfoCVAPIDataManager.swift
//  MyPersonalCVTests
//
//  Created by Eduardo Alvarado on 7/30/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import Foundation
@testable import MyPersonalCV

class MockDisplayInfoCVAPIDataManager: DisplayInfoCVAPIDataManagerInputProtocol {
  var completionSuccess: Bool = true
  var fetchInfoCVDataCalled: Bool = false

  func fetchInfoCVData(completion: @escaping (APIResult<InfoCVModel, APIError>) -> Void) {
    fetchInfoCVDataCalled = true
    if completionSuccess {
      let dummySection = Section(title: "title", description: "description", imageURL: "imageURL")
      let dummyData = InfoCVModel(fullName: "fullname", photoURL: "photoURL", sections: [dummySection])
      completion(.success(dummyData))
    } else {
      completion(.failure(.badResponse))
    }
  }
}
