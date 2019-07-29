//
//  DisplayInfoCVViewCell.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/29/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit

class DisplayInfoCVViewCell: UICollectionViewCell {
  // MARK: - IBOulets
  @IBOutlet var textLabel: UILabel?

  // MARK: - View life cycle
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  /// Configure the cell with specific section
  func configure(with section: Section) {
    textLabel?.text = section.title
  }
}
