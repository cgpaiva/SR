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
    func request<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func request<T>(completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {

        let firestoreDb = Firestore.firestore()
        
        let liturgiaCollection = firestoreDb.collection("liturgiaDiaria").document("15-02-2023")
        
        liturgiaCollection.getDocument { snapshot, error in
    
            try! snapshot?.decoded()
            
            if let document = snapshot, document.exists {
                do {
                    
//                    let jsonData = try JSONSerialization.data(withJSONObject: document.data(), options: [])
//                    let evangelho = try JSONDecoder().decode(LiturgiaDiaria.self, from: jsonData)
//                    print(try! JSONEncoder().encode(evangelho))
                    
                    
                } catch {
                    print("Falha no parse")
                }
            } else {
                print("Documento nao encontrado")
            }
        }
        
    }
}
