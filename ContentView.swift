import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Task.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Task.priorityNum, ascending: false)], animation: .default)
    
    private var tasks: FetchedResults<Task>
    
    
    @State private var showNewTask: Bool = false
    @State private var searchTask: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(tasks){ task in
                        TaskListRow(task: task)
                    }
                }
                if tasks.count == 0 {
                    Image("no-data")
                        .resizable()
                        .scaledToFit()
                }
                
                if self.showNewTask {
                    BlankView()
                        .onTapGesture {
                            self.showNewTask = false
                        }
                    
                    NewTaskView(isShow: self.$showNewTask)
                        .transition(.move(edge: .bottom))
                        .animation(.default, value: self.showNewTask)
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        self.showNewTask = true
                    }){
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.accentColor)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    EditButton()
                        .foregroundColor(.blue)
                        .opacity(self.tasks.count == 0 ? 0.5 : 1)
                        .disabled(self.tasks.count == 0)
                }
                
            }
        }.searchable(text: self.$searchTask)
    }
}
