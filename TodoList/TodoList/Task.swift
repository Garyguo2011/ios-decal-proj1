//
//  Task.swift
//  TodoList
//
//  Created by Xinran Guo on 10/12/15.
//  Copyright © 2015 Xinran Guo. All rights reserved.
//

import UIKit

class Task: NSObject {
    var name: NSString = ""
    var completed: Bool = false
    var creationDate: NSDate = NSDate()
    
    init(name: String){
        self.name = name
        self.completed = false
        self.creationDate = NSDate()
    }
}
