//
//  DisplayInfoCVWireFrame.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit

class DisplayInfoCVWireFrame: DisplayInfoCVWireFrameProtocol {

  private func createDisplayInfoCVViewController() -> DisplayInfoCVViewController {
    return DisplayInfoCVViewController.instantiate()
  }

  func presentDisplayInfoCVModule() {
    // Generating module components
    let view = createDisplayInfoCVViewController()
    let presenter: DisplayInfoCVPresenterProtocol & DisplayInfoCVInteractorOutputProtocol = DisplayInfoCVPresenter()
    let interactor: DisplayInfoCVInteractorInputProtocol = DisplayInfoCVInteractor()
    let dataManager: DisplayInfoCVAPIDataManagerInputProtocol = DisplayInfoCVAPIDataManager()
    let wireFrame: DisplayInfoCVWireFrameProtocol = DisplayInfoCVWireFrame()

    // Connecting
    view.presenter = presenter
    presenter.view = view
    presenter.wireFrame = wireFrame
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.dataManager = dataManager

    let navigationController = UINavigationController(rootViewController: view)
    UIApplication.shared.keyWindow?.rootViewController = navigationController
  }

  func presentSelected(_ section: Section) {
    let wireFrame = DetailInfoCVWireFrame()
    wireFrame.presentDetailInfoCVModule(with: section)
  }
}
