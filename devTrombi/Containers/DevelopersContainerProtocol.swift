//
//  DevelopersContainer.swift
//  devTrombi
//
//  Created by celine dann on 16/05/2019.
//  Copyright © 2019 celine dann. All rights reserved.
//

import Foundation

protocol DeveloperContainer {
    var developers: [Developer]? { get }
    var delegate: DeveloperContainerDelegate? { get set }
    func getDevs()
}

protocol DeveloperContainerDelegate: class {
    func onComplete(result: Result<[Developer], Error>)
    func onProgress(progress: Double)
}
