//
//  NeworkServise.swift
//  03_MVP_vebinar
//
//  Created by fedir on 01.10.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation
import UIKit
//MARK: - протокол для сетевых классов с указанием парвметров функции
protocol NetWorkServiessprotocol {
    func getComment(completion: @escaping (Result<[Comment]?,Error>) -> Void)
}

class NeworkServise: NetWorkServiessprotocol {
    func getComment(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        let urlStr = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlStr) else { return }
        URLSession.shared.dataTask(with: url) { (data,_, error) in
            if let error = error {
                completion(.failure(error))
            }
            do {
                let obj = try JSONDecoder().decode([Comment].self, from: data!)
                print(obj)
                completion(.success(obj))
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
    
    
}
