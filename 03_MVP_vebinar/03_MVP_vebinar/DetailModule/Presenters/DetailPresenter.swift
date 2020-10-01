//
//  DetailPresenter.swift
//  03_MVP_vebinar
//
//  Created by fedir on 01.10.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation

protocol DetailViewProtocol: class {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: class {
    init(view: DetailViewProtocol,networkServ: NetWorkServiessprotocol,comment: Comment?)
    func setComment()
}

class DetailPresenter: DetailViewPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    let networkServ: NetWorkServiessprotocol!
    var comment: Comment?
    
    required init(view: DetailViewProtocol, networkServ: NetWorkServiessprotocol, comment: Comment?) {
        self.view = view
        self.networkServ = networkServ
        self.comment = comment
        
    }
    
    public func setComment() {
        self.view?.setComment(comment: comment)
    }
    
    
}
