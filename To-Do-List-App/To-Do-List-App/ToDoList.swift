//
//  ToDoList.swift
//  To-Do-List-App
//
//  Created by Prathiba Lingappan on 3/1/17.
//  Copyright © 2017 Prathiba Lingappan. All rights reserved.
//

import Foundation

class ToDoList {
    var name: String
    var items: [String]
    
    init(_ name: String, _ items: [String]){
        self.name = name
        self.items = items
    }
    
   static var listWithItemsArray:[ToDoList] = [
        ToDoList("Shopping", ["iPhone cover", "face wash", "shoes", "wine glasses"]),
        ToDoList("Work", ["Closures", "Auto Layout"]),
        
        ]
    
}

//class ToDoList {
//    var name: String
//    var items: [String]?
//    
//    init(_ name: String){
//        self.name = name
//        self.items = []
//    }
//    
//}



