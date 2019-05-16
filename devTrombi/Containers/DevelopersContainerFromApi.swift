//
//  DevelopersContainerFromApi.swift
//  devTrombi
//
//  Created by celine dann on 16/05/2019.
//  Copyright © 2019 celine dann. All rights reserved.
//

import Foundation

class DeveloperContainerFromApi: DeveloperContainer {
    let apiService: ApiService
    var developers: [Developer]?
    weak var delegate: DeveloperContainerDelegate?
    let url = URL(string: "https://dev.mystudiofactory.com/trombi/")!
    
    init(apiService: ApiService? = nil) {
        self.apiService = apiService ?? ApiServiceFromAlamofire()
    }
    
    private func convertSetInBool(set: String) -> Bool? {
        switch set {
        case "Y":
            return true
        case "N":
            return false
        default:
            return nil
        }
    }
    
    func getDevs() {
        let onComplete: (Result<Data, Error>) -> () = { [weak self] (result) in
            let developers = result.flatMap({ (datas) -> Result<[Developer], Error> in
                do {
                    let decoder = JSONDecoder()
                    let api = try decoder.decode(devApiStruct.self, from: datas)
                    let developers = try api.list.map({ (devData) -> Developer in
                        guard  let id = Int(devData.id) else {
                            throw ApiError.IdFormatError
                        }
                        guard let hired = self?.convertSetInBool(set: devData.hired) else {
                            throw ApiError.HiredFormatError
                        }
                        return Developer(id: id, name: devData.name, description: devData.description, picture: devData.picture, hired: hired)
                        
                    })
                    self?.developers = developers.sorted(by: { $0.name < $1.name })
                    return Result.success(developers)
                } catch let error {
                    print(error)
                    return Result.failure(ApiError.unexpectedFormat)
                }
            })
            self?.delegate?.onComplete(result: developers)
        }
        let onProgress: ((Double) -> ())? = delegate?.onProgress(progress:)
        apiService.get(url: url, onComplete: onComplete, onProgress: onProgress)
    }
}

extension DeveloperContainerFromApi {
    enum ApiError: Error {
        case unexpectedFormat
        case IdFormatError
        case HiredFormatError
    }
    
    struct devApiStruct: Codable {
        let list: [devDatas]
    }
    
    struct devDatas: Codable {
        var id: String
        var name: String
        var description: String
        var picture: String
        var hired: String
    }
}
