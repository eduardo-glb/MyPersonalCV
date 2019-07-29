//
//  DisplayInfoCVViewController.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit

class DisplayInfoCVViewController: UIViewController {
  // MARK: - IBOulets
  @IBOutlet var collectionView: UICollectionView?

  // MARK: - Attributes
  var presenter: DisplayInfoCVPresenterProtocol?
  public var infoCVModel: InfoCVModel?

  // MARK: - Private attributes
  private let localizable = AppLocalizable()

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    collectionView?.refreshControl?.beginRefreshing()
    presenter?.viewReady()
  }

  // MARK: - Private methods
  private func setupUI() {
    collectionView?.register(UINib(nibName: Constants.NibIdentifier.informationNib, bundle: .main), forCellWithReuseIdentifier: Constants.CellIdentifier.information)
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(pullToRefresh(_:)), for: .valueChanged)
    collectionView?.refreshControl = refreshControl
  }

  @objc public func pullToRefresh(_ sender: UIRefreshControl) {
    collectionView?.refreshControl?.beginRefreshing()
    presenter?.viewReady()
  }
}

extension DisplayInfoCVViewController: DisplayInfoCVViewProtocol {
  static var storyboardFileName: String = Constants.StoryboardIdentifier.displayInfoCV

  func loadInfoCVData(_ data: InfoCVModel) {
    collectionView?.refreshControl?.endRefreshing()
    infoCVModel = data
    self.title = data.fullName
    collectionView?.reloadData()
  }

  func showError(title: String, message: String) {
    let alertController = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: localizable.errorAcceptButton,
                                            style: .cancel,
                                            handler: nil))
    self.present(alertController, animated: true, completion: { [unowned self] in
      self.collectionView?.refreshControl?.endRefreshing()
    })
  }
}

extension DisplayInfoCVViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return infoCVModel?.sections.count ?? 0
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let section = infoCVModel?.sections[indexPath.row] else {
      fatalError(localizable.errorMsgEmptySections)
    }

    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.information, for: indexPath) as? DisplayInfoCVViewCell {
      cell.configure(with: section)

      return cell
    }

    return UICollectionViewCell()
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let section = infoCVModel?.sections[indexPath.row] else {
      fatalError(localizable.errorMsgEmptySections)
    }

    presenter?.select(section)
  }
}
