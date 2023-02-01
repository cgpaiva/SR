//
//  SnapKitable.swift
//  ParoquiaSaoRoque
//
//  Created by Gabriel on 26/01/23.
//

import Foundation

protocol SnapKitable {
    func setupConstraints()
    func configViews()
    func configActions()
    func configHierarchy()
    
    func setupViews()
}

extension SnapKitable {
    func setupViews() {
        configHierarchy()
        setupConstraints()
        configViews()
        configActions()
    }

}
