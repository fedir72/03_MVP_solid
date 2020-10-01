//
//  Comment .swift
//  03_MVP_vebinar
//
//  Created by fedir on 01.10.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import Foundation

struct Comment: Codable {
   var postId: Int
   var id: Int
   var name: String
   var email:String
   var body:String
}
