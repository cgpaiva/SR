//
//  LiturgiaViewController.swift
//  ParoquiaSaoRoque
//
//  Created by Gabriel on 26/01/23.
//

import Foundation
import UIKit
import MaterialComponents


class LiturgiaViewController: UIViewController {
    
    let service: NetworkServiceProtocol
    var theView: LiturgiaView?
    
    override func loadView() {
        self.view = LiturgiaView()
        
        guard let secureView = view else { return }
        guard let liturgiaView = secureView as? LiturgiaView else { return }
        self.theView = liturgiaView
        theView?.liturgiaTabBar.tabBarDelegate = self

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    private func loadData() {
        service.request(router: .liturgia(date: "15-02-2023")) { (
            result: Result<LiturgiaDiaria, Error>) in
            
            switch result {
            case .success(let liturgia):
                self.theView?.viewModel = LiturgiaViewModel(liturgia: liturgia)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    init(service: NetworkServiceProtocol) {
         self.service = service
         super.init(nibName: nil, bundle: nil)
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}

extension LiturgiaViewController: MDCTabBarViewDelegate, UIScrollViewDelegate {
    
    func tabBarView(_ tabBar: MDCTabBarView, shouldSelect item: UITabBarItem) -> Bool {
        return true
    }
    
    func tabBarView(_ tabBarView: MDCTabBarView, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            theView?.updateTab(tabType: .leituras)
        case 1:
            theView?.updateTab(tabType: .salmo)
        case 2:
            theView?.updateTab(tabType: .evangelho)
        default:
            break;
        }
    }
}
