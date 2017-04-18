//
//  ListItemsTableViewController.swift
//  To-Do-List-App
//
//  Created by Prathiba Lingappan on 3/1/17.
//  Copyright © 2017 Prathiba Lingappan. All rights reserved.
//

import UIKit

class ListItemsTableViewController: UITableViewController {

    var toDoListObj: ToDoList!
    
    @IBOutlet weak var navItem: UINavigationItem!
    
    var selectedIndexPathTwo : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navItem.title = toDoListObj.name

        navItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dump(toDoListObj)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if tableView.isEditing{
            return toDoListObj.items.count + 1
        }else{
            if toDoListObj.items.isEmpty{
                return 1
            }
            return toDoListObj.items.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ListItemsTableViewCell
        
        if tableView.isEditing{
            toDoListObj.items.append(cell.itemName.text!)
            
//            for i in 0..<ToDoList.listWithItemsArray.count{
//                if ToDoList.listWithItemsArray[i].name == tempItemName{
//                    ToDoList.listWithItemsArray[i].items!.append(tempItems[tempItems.count - 1])
//                    break
//                }
//            }
        }
        else{
            if toDoListObj.items.count == indexPath.row {
              toDoListObj.items.append(cell.itemName.text!)
            }
            else{
                cell.itemName.text = toDoListObj.items[indexPath.row]
            }
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .insert
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
        case .delete:
            break
        case .insert:
            break
        case .none:
            break
        }
        
        
        tableView.insertRows(at: [indexPath], with: .bottom)
        
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//            print("inside ELSE in commit")
//            tableView.insertRows(at: [indexPath], with: .automatic)
//        }  
        
    }
    
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        
//        let remove = UITableViewRowAction(style: .normal, title: "Remove") { (action, indexPath) in
//            self.toDoListObj.items.remove(at: indexPath.row)
//            tableView.reloadData()
//        }
//        
//        remove.backgroundColor = UIColor(red:0.95, green:0.85, blue:0.00, alpha:1.0)
//        
//        return [remove]
//    }
//
}
