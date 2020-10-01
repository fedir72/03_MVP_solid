//
//  ModuleBuilder.swift
//  03_MVP_vebinar
//
//  Created by fedir on 01.10.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailModule(comment: Comment?) -> UIViewController }

class ModuleBuilder: Builder {
    
    
    static func createDetailModule(comment: Comment?) -> UIViewController {
        let view = DetailController()
        let netLayer = NeworkServise()
        let presenter = DetailPresenter(view: view, networkServ: netLayer, comment: comment)
        view.presenter = presenter
               return view
    }
    
    
    static func createMainModule() -> UIViewController {
        
        let view = MainViewController()
        let netLayer = NeworkServise()
        let presenter = MainPresenter(view: view, networkService: netLayer)
        view.presenter = presenter
        return view
    }
    
    
    
    
}
