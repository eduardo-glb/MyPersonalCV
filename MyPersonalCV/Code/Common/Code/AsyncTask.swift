//
//  AsyncTask.swift
//  MyPersonalCV
//
//  Created by Eduardo Alvarado on 7/18/19.
//  Copyright © 2019 Empresa. All rights reserved.
//

import Foundation

typealias AsyncBlock = () -> Void

// MARK: - Public methods

/// Submits a item into the main dispatch queue for asynchronous execution after a specified time.
///
/// - Parameters:
///   - delay: a period of time to wait
///   - queue: manages the execution of work items, by default is main
///   - closure: completion work for the item
@inline(__always) func performTaskAfter(_ delay: Double,
                                        on queue: DispatchQueue = DispatchQueue.main,
                                        closure: @escaping AsyncBlock) {
  queue.asyncAfter(
    deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
    execute: closure
  )
}

/// Submits a item into the main dispatch queue and optionally associates it with a dispatch group.
///
/// - Parameters:
///   - queue: manages the execution of work items, by default is main
///   - closure: completion work for the item
@inline(__always) func performAsyncTask(on queue: DispatchQueue = DispatchQueue.main,
                                        closure: @escaping AsyncBlock) {
  queue.async(execute: closure)
}
