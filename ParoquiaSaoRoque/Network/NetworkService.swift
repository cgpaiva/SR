//
//  NetworkService.swift
//  ParoquiaSaoRoque
//
//  Created by Gabriel on 27/01/23.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func request<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func request<T>(completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {

        AF.request("https://liturgia.up.railway.app/", method: .get)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
