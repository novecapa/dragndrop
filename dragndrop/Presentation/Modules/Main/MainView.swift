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

    @State private var isBackGroundTargeted = false
    @State private var isToDoTargeted = false
    @State private var isInProgressTargeted = false
    @State private var isDoneTargeted = false

    var body: some View {
        HStack(spacing: 4) {
            let todo = KanbanEntity(id: UUID(),
                                      title: "TODO",
                                      subtitle: "Todo subtitle",
                                      backgroundColor: .cyan,
                                      tasks: toDoTasks,
                                      isTargeted: isToDoTargeted)
            KanbanView(kanban: todo)
                .dropDestination(for: DeveloperTaskEntity.self) { dropped, _ in
                    dropped.forEach { task in
                        inProgressTasks.removeAll { $0.id == task.id }
                        doneTasks.removeAll { $0.id == task.id }
                    }
                    let totalTasks = toDoTasks + dropped
                    toDoTasks = totalTasks.removeDuplicates
                    return true
                } isTargeted: { isTargeted in
                    isToDoTargeted = isTargeted
                }
            let inProgress = KanbanEntity(id: UUID(),
                                      title: "IN PROGRESS",
                                      subtitle: "In progress subtitle",
                                          backgroundColor: .yellow,
                                      tasks: inProgressTasks,
                                      isTargeted: isInProgressTargeted)
            KanbanView(kanban: inProgress)
                .dropDestination(for: DeveloperTaskEntity.self) { dropped, _ in
                    dropped.forEach { task in
                        toDoTasks.removeAll { $0.id == task.id }
                        doneTasks.removeAll { $0.id == task.id }
                    }
                    let totalTasks = inProgressTasks + dropped
                    inProgressTasks = totalTasks.removeDuplicates
                    return true
                } isTargeted: { isTargeted in
                    isInProgressTargeted = isTargeted
                }
            let done = KanbanEntity(id: UUID(),
                                      title: "DONE",
                                      subtitle: "Done subtitle",
                                          backgroundColor: .green,
                                      tasks: doneTasks,
                                      isTargeted: isDoneTargeted)
            KanbanView(kanban: done)
                .dropDestination(for: DeveloperTaskEntity.self) { dropped, _ in
                    dropped.forEach { task in
                        inProgressTasks.removeAll { $0.id == task.id }
                        toDoTasks.removeAll { $0.id == task.id }
                    }
                    let totalTasks = doneTasks + dropped
                    doneTasks = totalTasks.removeDuplicates
                    return true
                } isTargeted: { isTargeted in
                    isDoneTargeted = isTargeted
                }
        }
        .padding(4)
    }
}

#Preview {
    MainView()
}
