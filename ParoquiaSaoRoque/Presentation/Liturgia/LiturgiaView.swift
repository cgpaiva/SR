//
//  LiturgiaView.swift
//  ParoquiaSaoRoque
//
//  Created by Gabriel on 26/01/23.
//

import Foundation
import UIKit

class LiturgiaView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LiturgiaView: SnapKitable {
    func setupConstraints() {
        
    }
    
    func configViews() {
        backgroundColor = .white
    }
    
    func configActions() {
        
    }
    
    func configHierarchy() {
        
    }
    

}
