//
//  ApiServiceFromAlamofire.swift
//  devTrombi
//
//  Created by celine dann on 16/05/2019.
//  Copyright © 2019 celine dann. All rights reserved.
//

import Foundation
import Alamofire

typealias ApiResult = Swift.Result

class ApiServiceFromAlamofire: ApiService {
    func get(url: URL, onComplete: @escaping (ApiResult<Data, Error>) -> (), onProgress: ((Double) -> ())?) {
        let request = Alamofire.request(url)
        request.responseData(){
            response in
            switch response.result {
            case let Alamofire.Result.success(value):
                onComplete(ApiResult.success(value))
            case let Alamofire.Result.failure(error):
                onComplete(ApiResult.failure(error))
            }
            
        }
        request.downloadProgress { progress in
            onProgress?(progress.fractionCompleted)
        }
    }
}
