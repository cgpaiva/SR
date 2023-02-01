//
//  LiturgiaModel.swift
//  ParoquiaSaoRoque
//
//  Created by Gabriel on 27/01/23.
//

import Foundation

struct Liturgia: Codable {
    let data, liturgia, cor, dia: String
    let oferendas, comunhao: String
    let primeiraLeitura: PrimeiraLeitura
    let segundaLeitura, salmo, evangelho: String
}

struct PrimeiraLeitura: Codable {
    let titulo, texto: String
}

