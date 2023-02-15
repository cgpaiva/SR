//
//  LiturgiaModel.swift
//  ParoquiaSaoRoque
//
//  Created by Gabriel on 27/01/23.
//

import Foundation

struct LiturgiaDiaria: Codable {
    let corLiturgica: String
    let liturgiaTitulo: String
    let evangelho: [Evangelho]
    let liturgias: [Liturgia]
    let salmo: Salmo
    
    enum CodingKeys: String, CodingKey {
        case corLiturgica = "corLiturgica"
        case liturgiaTitulo = "liturgiaTitulo"
        case evangelho = "evangelho"
        case liturgias = "liturgias"
        case salmo = "salmo"
    }
}

struct Evangelho: Codable {
    let evangelhoTitulo: String
    let evangelho: String

    enum CodingKeys: String, CodingKey {
        case evangelhoTitulo = "evangelhoTitulo"
        case evangelho = "evangelho"
    }
}

struct Liturgia: Codable {
    let leitura: String
    let livroLeitura: String
    let tituloLeitura: String
    
    enum CodingKeys: String, CodingKey {
        case leitura = "leitura"
        case livroLeitura = "livroLeitura"
        case tituloLeitura = "tituloLeitura"
    }
}

struct Salmo: Codable {
    let salmo: String
    let salmoTitulo: String
    
    enum CodingKeys: String, CodingKey {
        case salmo = "salmo"
        case salmoTitulo = "salmoTitulo"
    }
}


