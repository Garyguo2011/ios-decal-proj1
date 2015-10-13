//
//  StatsViewController.swift
//  TodoList
//
//  Created by Xinran Guo on 10/12/15.
//  Copyright © 2015 Xinran Guo. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    @IBOutlet weak var numberOfCompleted: UILabel!
    var completed: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfCompleted.text = completed
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
