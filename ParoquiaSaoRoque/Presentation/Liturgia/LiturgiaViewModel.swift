//
//  LiturgiaViewModel.swift
//  ParoquiaSaoRoque
//
//  Created by Gabriel on 26/01/23.
//

import Foundation

protocol LiturgiaViewModelProtocol {
    
    var liturgia: LiturgiaDiaria { get }
    var corLiturgica: String { get }
    
}

class LiturgiaViewModel: LiturgiaViewModelProtocol {

    var liturgia: LiturgiaDiaria
    var corLiturgica: String

    init(liturgia: LiturgiaDiaria) {
        self.liturgia = liturgia
        self.corLiturgica = "Cor litúrgica: \(liturgia.corLiturgica)"
    }

}
