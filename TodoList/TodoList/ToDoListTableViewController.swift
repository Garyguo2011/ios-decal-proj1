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
    
    func removeTaskMoreThan24Hour(){
        for (var i = 0; i < tasks.count; i++) {
            if (tasks[i].completed) {
                let currentTime = NSDate()
                if (currentTime.timeIntervalSinceDate(tasks[i].completeDate!) > 86400) {
                    tasks.removeAtIndex(i)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        removeTaskMoreThan24Hour()
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
        completeTask.completeDate = NSDate()
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            tasks.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }

    @IBAction func cancelAddNewTask(segue: UIStoryboardSegue){
        removeTaskMoreThan24Hour()
    }
    
    @IBAction func saveNewTask(segue: UIStoryboardSegue){
        var source: ViewController = segue.sourceViewController as! ViewController
        var task: Task = source.newTask!
        if task.name != "" {
            self.tasks.append(task)
        }
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Stats" {
            let nav = segue.destinationViewController as! UINavigationController
            let dest = nav.topViewController as! StatsViewController
            dest.completed = totalCompleted()
        }
    }
    
    func totalCompleted() -> String {
        var num = 0
        for task in self.tasks {
            if task.completed {
                num+=1
            }
        }
        return String(num)
    }
    
}
