//
//  AppLocalizables.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import Foundation

class AppLocalizable {

  // Common

  /// Title for loader
  var loadingTitle: String {
    get {
      return "loading_title".localized
    }
  }

  /// Title for app
  var appTitle: String {
    get {
      return "app_title".localized
    }
  }

  // Error messages
  var errorTitle: String {
    get {
      return "error_title".localized
    }
  }

  var errorMsgDefault: String {
    get {
      return "error_msg_default".localized
    }
  }

  var errorMsgBadResponse: String {
    get {
      return "error_msg_badResponse".localized
    }
  }

  var errorMsgBadURL: String {
    get {
      return "error_msg_badURL".localized
    }
  }

  var errorMsgNoConnection: String {
    get {
      return "error_msg_noNetworkConnection".localized
    }
  }

  var errorMsgTimeout: String {
    get {
      return "error_msg_timeout".localized
    }
  }

  var errorMsgEmptySections :String {
    get {
      return "error_msg_emptySections".localized
    }
  }

  var errorAcceptButton: String {
    get {
      return "error_accept_button".localized
    }
  }
}
