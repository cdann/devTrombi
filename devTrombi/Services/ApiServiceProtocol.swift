//
//  ApiService.swift
//  devTrombi
//
//  Created by celine dann on 16/05/2019.
//  Copyright © 2019 celine dann. All rights reserved.
//

import Foundation

protocol ApiService{
    func get(url: URL, onComplete: @escaping (Result<Data, Error>) -> (), onProgress: ((Double) -> ())?)
}
