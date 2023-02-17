//
//  SRError.swift
//  ParoquiaSaoRoque
//
//  Created by Gabriel on 16/02/23.
//

import Foundation


enum SRError: Error {
    case liturgiaError
    case genericError
    
    var error: NSError {
        switch self {
        case .liturgiaError:
            return NSError(domain: "Ops! Houve um problema ao recuperar a liturgia diária. Por favor, tente novamente mais tarde.", code: 1520)
        case .genericError:
            return NSError(domain: "Ops! Algo deu errado. Por favor, tente novamente mais tarde.", code: 1520)
        }
    }
}
