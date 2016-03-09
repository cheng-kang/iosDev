//
//  TaskManager.swift
//  To-do List
//
//  Created by Ant on 3/9/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

var taskMgr: TaskManager = TaskManager()

struct task {
    var name = "Unnamed"
    var desc = "Undescribed"
}

class TaskManager: NSObject {
    var tasks = [task]()
    
    func addTask(name: String, desc: String){
        tasks.append(task(name: name, desc: desc))
    }
}
