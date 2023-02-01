//
//  LiturgiaViewController.swift
//  ParoquiaSaoRoque
//
//  Created by Gabriel on 26/01/23.
//

import Foundation
import UIKit


class LiturgiaViewController: UIViewController {
    
    let service: NetworkServiceProtocol
    let viewModel: LiturgiaViewModelProtocol
    
    override func loadView() {
        self.view = LiturgiaView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    private func loadData() {
        service.request { (
            result: Result<Liturgia, Error>) in
            
            switch result {
            case .success(let liturgia):
                print("")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    init(service: NetworkServiceProtocol, viewModel: LiturgiaViewModelProtocol) {
         self.service = service
         self.viewModel = viewModel
         super.init(nibName: nil, bundle: nil)
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}
