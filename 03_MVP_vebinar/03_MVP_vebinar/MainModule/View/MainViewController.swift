//
//  MainViewController.swift
//  03_MVP_vebinar
//
//  Created by fedir on 01.10.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
     
    //MARK: - IBOoutlet
    @IBOutlet weak var greetingLabel: UILabel!
    
    var presenter: MainViewPresenterprotocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func didTupButtonAction(_ Sender: Any) {
        self.presenter.showGreeting()
    }

}

extension MainViewController: MainViewProtocol {
    
    func setGreting(greeting: String) {
        self.greetingLabel.text = greeting
    }
}
