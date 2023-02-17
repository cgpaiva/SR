//
//  NetworkService.swift
//  ParoquiaSaoRoque
//
//  Created by Gabriel on 27/01/23.
//

import Foundation
import Alamofire
import FirebaseFirestore
import FirebaseCore

protocol NetworkServiceProtocol {
    func request<T: Codable>(router: SRRouter, completion: @escaping (Result<T, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func request<T>(router: SRRouter, completion: @escaping (Result<T, Error>) -> Void) where T : Codable {
        
        router.reference.getDocument { snapshot, error in
            
            guard let document = snapshot, document.exists else { return }
            guard let data = document.data() else { return }
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                let response = try JSONDecoder().decode(T.self, from: jsonData)
                
                completion(.success(response))
                
            } catch {
                completion(.failure(SRError.genericError.error))
            }
        }
    }
}
