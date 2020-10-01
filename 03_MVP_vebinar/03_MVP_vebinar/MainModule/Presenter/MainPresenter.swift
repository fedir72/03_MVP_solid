//
//  MainPresenter.swift
//  03_MVP_vebinar
//
//  Created by fedir on 01.10.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation

protocol MainViewProtocol: class {
    func sucsess()
    func failure(error: Error)
}

protocol MainViewPresenterprotocol: class {
    init(view: MainViewProtocol,networkService: NetWorkServiessprotocol)
  func getComments()
    var comments: [Comment]? {get set}
}

class MainPresenter: MainViewPresenterprotocol {
   
    weak var view: MainViewProtocol?
    let networkServece: NetWorkServiessprotocol!
    
    var comments: [Comment]?
     
    required init(view: MainViewProtocol, networkService: NetWorkServiessprotocol ) {
        self.view = view
        self.networkServece = networkService
        getComments()
    }
    
    func getComments() {
        networkServece.getComment { [weak self] (result) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.sucsess()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
}
