//
//  TaskListRow.swift
//  CRUDSwiftPlayground
//
//  Created by Rivaldo Fernandes on 17/04/22.
//

import Foundation
import SwiftUI

struct TaskListRow: View {
    @ObservedObject var task: Task
    
    
    var body: some View {
        Toggle(isOn: self.$task.complete){
            HStack {
                Text(self.task.name)
                    .fontWeight(.bold)
                    .strikethrough(self.task.complete, color: self.task.priority.priorityColor())
                    .opacity(self.task.complete ? 0.5 : 1)
                
                Spacer()
                
                Circle()
                    .frame(width: 10)
                    .foregroundColor(self.task.priority.priorityColor())
            }
        }
        .toggleStyle(CheckBoxStyle(taskColor: self.task.priority.priorityColor()))
    }
}


// you may remove this preview or update
struct TaskListRow_Previews: PreviewProvider {
    static var previews: some View {
        let testTask = Task(context: PersistenceController.preview.container.viewContext)
        testTask.id = UUID()
        testTask.name = "Test Task"
        testTask.complete = true
        testTask.priority = .low
        
        
        return TaskListRow(task: testTask)
    }
}
