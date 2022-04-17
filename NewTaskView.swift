//
//  NewTaskView.swift
//  CRUDSwiftPlayground
//
//  Created by Rivaldo Fernandes on 17/04/22.
//

import Foundation
import SwiftUI


struct NewTaskView: View {
    @Binding var isShow: Bool
    
    
    @State private var taskName: String = ""
    @State private var taskPriority: Priority = .normal
    @State private var isEditing: Bool = false
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading){
                HStack {
                    Text("Add new task")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    
                    Button(action: {
                        self.isShow = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(self.taskPriority.priorityColor())
                    }
                }
                
                TextField("New Task Description", text: self.$taskName, onEditingChanged: {
                    self.isEditing = $0
                })
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.bottom)
                
                Text("Priority")
                    .fontWeight(.semibold)
                
                HStack {
                    PriorityView(priorityTitle: "High", selectedPriority: self.$taskPriority)
                        .onTapGesture {
                            self.taskPriority = .high
                        }
                    
                    PriorityView(priorityTitle: "Normal", selectedPriority: self.$taskPriority)
                        .onTapGesture {
                            self.taskPriority = .normal
                        }
                    
                    PriorityView(priorityTitle: "Low", selectedPriority: self.$taskPriority)
                        .onTapGesture {
                            self.taskPriority = .low
                        }
                }
                
                Button(action: {
                    guard self.taskName.trimmingCharacters(in: .whitespaces) != "" else {
                        return
                    }
                    
                    self.isShow = false
                }){
                    Text("Add new Task")
                        .font(.system( .title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(self.taskPriority.priorityColor())
                }
                .cornerRadius(10)
                .padding(.vertical)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10, antialiased: true)
            .offset(y: self.isEditing ? -320 : 0)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(isShow: .constant(true))
    }
}
