//
//  SRRouter.swift
//  ParoquiaSaoRoque
//
//  Created by Gabriel on 16/02/23.
//

import Foundation
import FirebaseFirestore
import FirebaseCore

enum SRRouter {
    case liturgia(date: String)
    
    var reference: DocumentReference {
        let firestore = Firestore.firestore()
        
        switch self {
        case .liturgia(let date):
            return firestore.collection("liturgiaDiaria").document(date)
        }
    }
    
}
