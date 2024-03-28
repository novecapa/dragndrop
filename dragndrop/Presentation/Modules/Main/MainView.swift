//
//  MainView.swift
//  dragndrop
//
//  Created by Josep Cerdá Penadés on 28/3/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var toDoTasks: [DeveloperTaskEntity] = DeveloperTaskEntity.mock
    @State private var inProgressTasks: [DeveloperTaskEntity] = []
    @State private var doneTasks: [DeveloperTaskEntity] = []
    
    @State private var isToDoTargeted = false
    @State private var isInProgressTargeted = false
    @State private var isDoneTargeted = false
    
    var body: some View {
        HStack(spacing: 12) {
            KanbanView(title: "To Do", tasks: toDoTasks, isTargeted: isToDoTargeted)
                .dropDestination(for: DeveloperTaskEntity.self) { dropped, location in
                    dropped.forEach { task in
                        inProgressTasks.removeAll { $0.id == task.id }
                        doneTasks.removeAll { $0.id == task.id }
                    }
                    let totalTasks = toDoTasks + dropped
                    toDoTasks = Array(Set(totalTasks))
                    return true
                } isTargeted: { isTargeted in
                    isToDoTargeted = isTargeted
                }
            KanbanView(title: "In Progress", tasks: inProgressTasks, isTargeted: isInProgressTargeted)
                .dropDestination(for: DeveloperTaskEntity.self) { dropped, location in
                    dropped.forEach { task in
                        toDoTasks.removeAll { $0.id == task.id }
                        doneTasks.removeAll { $0.id == task.id }
                    }
                    let totalTasks = inProgressTasks + dropped
                    inProgressTasks = Array(Set(totalTasks))
                    return true
                } isTargeted: { isTargeted in
                    isInProgressTargeted = isTargeted
                }
            KanbanView(title: "Done", tasks: doneTasks, isTargeted: isDoneTargeted)
                .dropDestination(for: DeveloperTaskEntity.self) { dropped, location in
                    dropped.forEach { task in
                        inProgressTasks.removeAll { $0.id == task.id }
                        toDoTasks.removeAll { $0.id == task.id }
                    }
                    let totalTasks = doneTasks + dropped
                    doneTasks = Array(Set(totalTasks))
                    return true
                } isTargeted: { isTargeted in
                    isDoneTargeted = isTargeted
                }
        }
        .padding()
    }
}

#Preview {
    MainView()
}
