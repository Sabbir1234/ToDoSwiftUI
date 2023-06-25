//
//  Task.swift
//  ToDoApp
//
//  Created by Sabbir Hossain on 25/6/23.
//

import Foundation

import RealmSwift

class Task: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String = ""
    @Persisted var isCompleted: Bool = false
}

