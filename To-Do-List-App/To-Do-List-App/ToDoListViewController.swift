//
//  ToDoListViewController.swift
//  To-Do-List-App
//
//  Created by Prathiba Lingappan on 3/1/17.
//  Copyright © 2017 Prathiba Lingappan. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var addNewList: UITextField!
    @IBOutlet weak var addButton: UIButton! 
    @IBOutlet weak var toDoList: UITableView!
    
    var toDoListsArray = ToDoList.listWithItemsArray
    var selectedIndexPath: IndexPath?
    
    @IBAction func addNewListFunc(_ sender: UIButton) {
        
        guard let newListName = addNewList.text else{
            return
        }
        toDoListsArray.append(ToDoList(newListName, []))
        toDoList.reloadData()
        addNewList.text = nil
        
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem;
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        
        super.setEditing(editing, animated: animated)
        toDoList.setEditing(editing, animated: animated)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        toDoList.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoListCell", for: indexPath) as! ToDoListTableViewCell
        
        cell.toDoListName.text = toDoListsArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        performSegue(withIdentifier: "listToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ListItemsTableViewController{
            if let selectedIndexPath = selectedIndexPath{
                destination.toDoListObj = toDoListsArray[selectedIndexPath.row]
           }
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        
        let editingStyle: UITableViewCellEditingStyle = .delete
        
        return editingStyle
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            toDoListsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //toDoList.reloadData()
        }
    }

}
