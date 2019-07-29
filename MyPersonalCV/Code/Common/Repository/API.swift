//
//  API.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import Foundation

// MARK: - API definition

/// Enlists the different kind of response errors handled by the library.
///
/// - badResponse: Throwed when the response couldn't be deserialized into an object
/// - badURL: Throwed when the URL couldn't be builded
/// - noNetworkConnection: Throwed when there's no outgoing connection
/// - timeout: Throwed when the time reaches the limit to response
/// - unkown: Throwed when the server ressponse with a different error
public enum APIError: Error {
  case badResponse
  case badURL
  case noNetworkConnection
  case timeout
  case unkown(String)
}

/// Represents the kind of result obtanied form a Web API request call.
///
/// - success: A successful response, containing the resultant object T.
/// - failure: An unsuccessful response, including the specific kind of error.
enum APIResult<T, APIError> {
  case success(T)
  case failure(APIError)
}

// MARK: - Endpoint definition
protocol Endpoint {
  var path: String { get }
  var url: String { get }
}

extension Endpoint {
  public var url: String {
    do {
      let baseURL: String = try Configuration.value(for: Constants.plistConfig.apiBaseURL)
      return "\(Constants.Request.https)\(baseURL)/\(path)"
    } catch { return "" }
  }
}

/// The enumeration for different services
enum Endpoints {

  /// GetCVInfo contains the data to build the view
  enum GetCVInfo: Endpoint {
    case fetchSuccess
    case fetchFail

    public var path: String {
      switch self {
      case .fetchSuccess:
        do {
          return try Configuration.value(for: Constants.plistConfig.getCVInfoSuccess)
        } catch { return "" }
      case .fetchFail:
        do {
          return try Configuration.value(for: Constants.plistConfig.getCVInfoFail)
        } catch { return "" }
      }
    }
  }
}
