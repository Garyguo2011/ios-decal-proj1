//
//  ToDoListTableViewController.swift
//  TodoList
//
//  Created by Xinran Guo on 10/12/15.
//  Copyright © 2015 Xinran Guo. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var tasks = [Task]()
    
    func loadInitialData(){
        var t1 = Task(name: "hw1")
        self.tasks.append(t1)
        var t2 = Task(name: "hw2")
        self.tasks.append(t2)
        var t3 = Task(name: "hw3")
        self.tasks.append(t3)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIndentifier: NSString = "ListPrototypeCell"
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellIndentifier as String)! as UITableViewCell
        var task: Task = self.tasks[indexPath.row] as Task
        if task.completed{
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        cell.textLabel!.text = task.name as String
        return cell
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        var completeTask: Task = self.tasks[indexPath.row] as Task
        completeTask.completed = !completeTask.completed
        tableView.reloadData()
    }

    @IBAction func cancelAddNewTask(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func saveNewTask(segue: UIStoryboardSegue){
        
    }
}
