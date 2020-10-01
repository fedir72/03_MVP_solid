//
//  MainPresenter.swift
//  03_MVP_vebinar
//
//  Created by fedir on 01.10.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation

protocol MainViewProtocol: class {
    func setGreting(greeting: String)
}

protocol MainViewPresenterprotocol: class {
    init(view: MainViewProtocol,person: Person)
    func showGreeting()
}

class MainPresenter: MainViewPresenterprotocol {
    
     let view: MainViewProtocol
     let person: Person
    
   
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = self.person.firstName + " " + self.person.lastName
        self.view.setGreting(greeting: greeting)
    }
 
}
