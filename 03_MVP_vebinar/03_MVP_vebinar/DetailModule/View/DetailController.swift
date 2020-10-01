//
//  DetailController.swift
//  03_MVP_vebinar
//
//  Created by fedir on 01.10.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet weak var coomentView: UITextView!

    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.setComment()
    }


   

}

extension DetailController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        coomentView.text = comment?.body
    }
    
    
}
