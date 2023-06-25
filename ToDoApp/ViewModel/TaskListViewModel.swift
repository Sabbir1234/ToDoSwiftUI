//
//  TaskListViewModel.swift
//  ToDoApp
//
//  Created by Sabbir Hossain on 25/6/23.
//

import Foundation

import SwiftUI
import RealmSwift

class TaskListViewModel: ObservableObject {
    @Published var tasks: Results<Task> = RealmManager.shared.getTasks()
    
    func addTask(title: String) {
        RealmManager.shared.addTask(title: title)
    }
    
    func deleteTasks(at offsets: IndexSet) {
        let tasksToDelete = offsets.map { tasks[$0] }
        for task in tasksToDelete {
            RealmManager.shared.deleteTask(task: task)
        }
    }
}
