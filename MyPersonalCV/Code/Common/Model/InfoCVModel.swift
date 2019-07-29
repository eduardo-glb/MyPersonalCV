//
//  InfoCVModel.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit

// MARK: - Section struct
/// The holder from user's information sections
struct Section: Codable {
  var title: String
  var description: String
  var imageURL: String
}

// MARK: - InfoCV struct
// Model to hold InfoCV response
public struct InfoCVModel: Codable {
  var fullName: String
  var photoURL: String
  var sections: [Section]
}
