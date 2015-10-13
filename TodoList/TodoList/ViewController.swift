//
//  ViewController.swift
//  TodoList
//
//  Created by Xinran Guo on 10/12/15.
//  Copyright © 2015 Xinran Guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var newTask: Task?
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

