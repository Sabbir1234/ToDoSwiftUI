//
//  TaskListView.swift
//  ToDoApp
//
//  Created by Sabbir Hossain on 25/6/23.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskListViewModel()
    @State private var newTaskTitle = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.tasks, id: \.self) { task in
                    TaskRowView(task: task)
                }
                .onDelete(perform: deleteTasks)
            }
            .navigationTitle("To-Do List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addTask) {
                        Image(systemName: "plus")
                    }
                }
            }
            .overlay(addTaskOverlay, alignment: .bottom)
        }
    }
    
    private func addTask() {
        guard !newTaskTitle.isEmpty else { return }
        
        viewModel.addTask(title: newTaskTitle)
        newTaskTitle = ""
    }
    
    private func deleteTasks(at offsets: IndexSet) {
        viewModel.deleteTasks(at: offsets)
    }
    
    @ViewBuilder
    private var addTaskOverlay: some View {
        HStack {
            TextField("New Task", text: $newTaskTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: addTask) {
                Text("Add")
                    .fontWeight(.bold)
            }
            .disabled(newTaskTitle.isEmpty)
        }
        .padding()
        .background(Color(.systemBackground))
    }
}
