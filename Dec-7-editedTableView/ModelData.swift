//
//  ModelData.swift
//  Dec-7-editedTableView
//
//  Created by Admin on 7/12/22.
//

import Foundation

struct List {
    var tasks: String
}

extension List {
    static let listOfTasks = [List(tasks: "a"),
                              List(tasks: "b"),
                              List(tasks: "c"),
                              List(tasks: "d"),
                              List(tasks: "e")
    ]
}
