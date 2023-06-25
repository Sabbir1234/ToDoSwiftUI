//
//  TaskRowView.swift
//  ToDoApp
//
//  Created by Sabbir Hossain on 25/6/23.
//

import SwiftUI

struct TaskRowView: View {
    @ObservedObject var task: Task
    
    var body: some View {
        Button(action: {
            updateTaskCompletion(newValue: !task.isCompleted)
        }, label: {
            HStack {
                Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                Text(task.title)
                    .strikethrough(task.isCompleted)
                    .foregroundColor(task.isCompleted ? .gray : .primary)
            }
        })
    }
    
    private func updateTaskCompletion(newValue: Bool) {
        RealmManager.shared.updateTask(task: task, isCompleted: newValue)
    }
}



