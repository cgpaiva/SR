//
//  QueryDocumentSnapshot+Extension.swift
//  ParoquiaSaoRoque
//
//  Created by gabriel on 15/02/23.
//

import Foundation
import FirebaseFirestore

extension DocumentSnapshot {
    func decoded<Type: Decodable>() throws -> Type {
        let jsonData = try JSONSerialization.data(withJSONObject: data(), options: [])
        let object = try JSONDecoder().decode(Type.self, from: jsonData)
        return object
    }
}

extension QuerySnapshot {
    func decoded<Type: Decodable>() throws -> [Type] {
        let objects: [Type] = try documents.map({try $0.decoded() })
        return objects
    }
}
