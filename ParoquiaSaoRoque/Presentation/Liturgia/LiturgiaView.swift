//
//  LiturgiaView.swift
//  ParoquiaSaoRoque
//
//  Created by Gabriel on 26/01/23.
//

import Foundation
import UIKit
import SnapKit
import MaterialComponents.MaterialTabs_TabBarView
import MaterialComponents.MaterialTabs_TabBarViewTheming

class LiturgiaView: UIView {
    
    let corLiturgica: UILabel
    let liturgiaTitleLabel: UILabel
    let liturgiaTabBar: MDCTabBarView
    let logo: UIImageView
    let liturgiaContainerScrollView: UIScrollView
    
    var viewModel: LiturgiaViewModelProtocol? {
        didSet {
            update()
        }
    }
    
    override init(frame: CGRect) {
        self.liturgiaTitleLabel = UILabel()
        self.corLiturgica = UILabel()
        self.liturgiaTabBar = MDCTabBarView()
        self.logo = UIImageView()
        self.liturgiaContainerScrollView = UIScrollView()
        super.init(frame: frame)
        setupViews()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func update() {
        corLiturgica.text = viewModel?.corLiturgica
        liturgiaTitleLabel.text = viewModel?.liturgia.liturgiaTitulo
    }
    
    func updateTab(tabType: TabBarType) {
        switch tabType {
        case .evangelho:
            liturgiaContainerScrollView.backgroundColor = .blue
        case .leituras:
            liturgiaContainerScrollView.backgroundColor = .black
        case .salmo:
            liturgiaContainerScrollView.backgroundColor = .white
        }
    }
    
}

extension LiturgiaView: SnapKitable {
    
    func render() {
        backgroundColor = .white
        corLiturgica.numberOfLines = 0
        liturgiaTitleLabel.numberOfLines = 0
        liturgiaContainerScrollView.backgroundColor = .blue
        logo.image = UIImage(named: "LogoParoquia")
        logo.contentMode = .scaleAspectFit

        liturgiaTabBar.sizeToFit()
        
        liturgiaTabBar.applySurfaceTheme(withScheme: MDCContainerScheme())
        
        corLiturgica.font = UIFont.systemFont(ofSize: 15)
        liturgiaTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        corLiturgica.textColor = UIColor(named: "fontColor")
        liturgiaTitleLabel.textColor = UIColor(named: "fontColor")
    }

    func setupConstraints() {
        
        logo.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(50)
            make.left.equalTo(snp.left).offset(50)
            make.right.equalTo(snp.right).offset(-50)
        }
        
        liturgiaTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(50)
            make.left.equalTo(snp.left).offset(20)
            make.right.equalTo(snp.right)
        }
        
        corLiturgica.snp.makeConstraints { make in
            make.top.equalTo(liturgiaTitleLabel.snp.bottom).offset(10)
            make.left.equalTo(snp.left).offset(20)
            make.right.equalTo(snp.right)
        }
        
        liturgiaTabBar.snp.makeConstraints { make in
            make.top.equalTo(corLiturgica.snp.bottom).offset(30)
            make.left.equalTo(snp.left).offset(20)
            make.right.equalTo(snp.right).offset(-20)
        }
        
        liturgiaContainerScrollView.snp.makeConstraints { make in
            make.top.equalTo(liturgiaTabBar.snp.bottom)
            make.left.equalTo(snp.left)
            make.right.equalTo(snp.right)
            make.bottom.equalTo(snp.bottom)
        }
        
    }
    
    func configViews() {
        
        liturgiaTabBar.items = [
            UITabBarItem(title: "Leituras", image: nil, tag: 0),
            UITabBarItem(title: "Salmo", image: nil, tag: 1),
            UITabBarItem(title: "Evangelho", image: nil, tag: 2),
        ]
        liturgiaTabBar.setSelectedItem(liturgiaTabBar.items[0], animated: true)

    }
    
    func configActions() {
        
    }
    
    func configHierarchy() {
        addSubview(corLiturgica)
        addSubview(liturgiaTabBar)
        addSubview(liturgiaTitleLabel)
        addSubview(liturgiaContainerScrollView)
        addSubview(logo)
    }

}

enum TabBarType {
    case leituras
    case salmo
    case evangelho
}
