//
//  XKCDComic.swift
//  imagelab
//
//  Created by Ahad Islam on 12/10/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import Foundation

struct XKCDComic: Codable {
    let img: String
    let num: Int
    
//    static private func getData(urlString: String) -> Data {
//        NetworkHelper.shared.performDataTask(with: urlString) { result in
//            switch result {
//            case .failure(let appError)
//            }
//        }
    

    static func getXKCDComic(with urlString: String, completionHandler: @escaping (Result<XKCDComic, AppError>) -> ()) {
        NetworkHelper.shared.performDataTask(with: urlString) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(.networkClientError(error)))
            case .success(let data):
                let xkcdComic = try! JSONDecoder().decode(XKCDComic.self, from: data)
                completionHandler(.success(xkcdComic))
            }
        }
}
}
