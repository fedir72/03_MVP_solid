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

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainViewPresenterprotocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
  

}

extension MainViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let comment = presenter.comments?[indexPath.row]
        cell.textLabel?.text = comment?.body
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = presenter.comments?[indexPath.row]
        let detailVC = ModuleBuilder.createDetailModule(comment: comment)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}

extension MainViewController: MainViewProtocol {
    func sucsess() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        let alert = UIAlertController(title:"посты не загрузились", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
       // print(error.localizedDescription)
    }
  
}
