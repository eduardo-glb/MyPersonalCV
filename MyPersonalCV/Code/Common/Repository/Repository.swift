//
//  Repository.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import UIKit

protocol RepositorySession: class {
  func callService(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}

extension URLSession: RepositorySession {
  func callService(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    let task = dataTask(with: url) { data, response, error in
      completion(data, response, error)
    }

    task.resume()
  }
}

class Repository {
  private let session: RepositorySession

  init(session: RepositorySession = URLSession.shared) {
    self.session = session
  }

  // MARK: - Public methods

  /// Call a generic service defined by url and completion APIResult type.
  ///
  /// - Parameters:
  ///   - url: a valid URL to get JSON response
  ///   - completion: a closure for call back
  func callService<T: Decodable>(url: String, completion: @escaping (APIResult<T, APIError>) -> ()) {
    guard let url = URL(string: url) else {
      completion(.failure(.badURL))
      return
    }

    session.callService(url: url) { data, response, error in
      if let error = error {  // Check for the error
        performAsyncTask {
          completion(.failure(.unkown(error.localizedDescription)))
        }
      } else if let data = data,
        let response = response as? HTTPURLResponse,
        response.statusCode == 200 {  // Check for the data

        do {
          // The data is parsed into a model of codable type
          let responseModel = try JSONDecoder().decode(T.self, from: data)
          performAsyncTask {
            completion(.success(responseModel))
          }
        } catch {
          performAsyncTask {
            completion(.failure(.badResponse))
          }
        }
      }
    }
  }


  /// Call a generic service defined by url and completion UIImage type
  ///
  /// - Parameters:
  ///   - url: a valid URL to get image data response
  ///   - completion: a closure for call back
  func getImage(from url: String, completion: @escaping (APIResult<UIImage, APIError>) -> ()) {
    guard let url = URL(string: url) else {
      completion(.failure(.badURL))
      return
    }

    session.callService(url: url) { data, response, error in
      guard
        let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
        let mimeType = httpURLResponse.mimeType, mimeType.hasPrefix("image"),
        let data = data, error == nil,
        let image = UIImage(data: data)
        else {
          completion(.failure(.badResponse))
          return
      }

      performAsyncTask {
        completion(.success(image))
      }
    }
  }
}
