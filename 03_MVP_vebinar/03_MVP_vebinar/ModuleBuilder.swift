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
 }

class ModuleBuilder: Builder {
    
    static func createMainModule() -> UIViewController {
        let model = Person(firstName: "David", lastName: "Blame")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
    
    
}
