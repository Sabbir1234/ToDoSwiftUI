//
//  RealmManager.swift
//  ToDoApp
//
//  Created by Sabbir Hossain on 25/6/23.
//

import Foundation

import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    private let realm = try! Realm()
    
    func getTasks() -> Results<Task> {
        return realm.objects(Task.self)
    }
    
    func addTask(title: String) {
        let newTask = Task()
        newTask.title = title
        
        try! realm.write {
            realm.add(newTask)
        }
    }
    
    func updateTask(task: Task, isCompleted: Bool) {
        try! realm.write {
            task.isCompleted = isCompleted
        }
    }
    
    func deleteTask(task: Task) {
        try! realm.write {
            realm.delete(task)
        }
    }
}
