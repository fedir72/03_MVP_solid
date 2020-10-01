//
//  MainPresenterTest.swift
//  03_MVP_vebinarTests
//
//  Created by fedir on 01.10.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import XCTest
@testable import _3_MVP_vebinar

class MockView: MainViewProtocol {
    var titleText: String?
    func setGreting(greeting: String) {
        self.titleText = greeting
    }
    
    
}



class MainPresenterTest: XCTestCase {
    
    var view: MockView!
    var person: Person!
    var presenter: MainPresenter!

    override func setUpWithError() throws {
     view = MockView()
     person = Person(firstName: "Baz", lastName: "Bar")
     presenter = MainPresenter(view: view, person: person)
    }

    override func tearDownWithError() throws {
     view = nil
     person = nil
     presenter = nil
    }

    func testModuleIsNotNil() {
      XCTAssertNotNil(view,"view is not nil")
      XCTAssertNotNil(person,"view is not nil")
      XCTAssertNotNil(presenter,"view is not nil")
        
    }
    
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleText, "Baz Bar" )
    }
    
    func testPersonModel() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Bar")
        
    }

}
