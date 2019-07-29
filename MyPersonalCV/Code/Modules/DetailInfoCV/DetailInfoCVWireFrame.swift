//
//  DetailInfoCVWireFrame.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/23/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit

class DetailInfoCVWireFrame: DetailInfoCVWireFrameProtocol {

  private func createDetailInfoCVViewController() -> DetailInfoCVViewController {
    return DetailInfoCVViewController.instantiate()
  }

  func presentDetailInfoCVModule(with section: Section) {
    // Generating module components
    let view = createDetailInfoCVViewController()
    let presenter: DetailInfoCVPresenterProtocol & DetailInfoCVInteractorOutputProtocol = DetailInfoCVPresenter(section: section)
    let interactor: DetailInfoCVInteractorInputProtocol = DetailInfoCVInteractor()
    let dataManager: DetailInfoCVAPIDataManagerInputProtocol = DetailInfoCVAPIDataManager()
    let wireFrame: DetailInfoCVWireFrameProtocol = DetailInfoCVWireFrame()

    // Connecting
    view.presenter = presenter
    presenter.view = view
    presenter.wireFrame = wireFrame
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.dataManager = dataManager

    if let rootView = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
      rootView.pushViewController(view, animated: true)
    }
  }
}
