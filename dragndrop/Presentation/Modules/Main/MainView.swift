//
//  MainView.swift
//  dragndrop
//
//  Created by Josep Cerdá Penadés on 28/3/24.
//

import SwiftUI

struct MainView: View {

    @State private var backgroundTasks: [DeveloperTaskEntity] = DeveloperTaskEntity.mock
    @State private var toDoTasks: [DeveloperTaskEntity] = []
    @State private var inProgressTasks: [DeveloperTaskEntity] = []
    @State private var doneTasks: [DeveloperTaskEntity] = []

    @State private var isBackGroundTargeted = false
    @State private var isToDoTargeted = false
    @State private var isInProgressTargeted = false
    @State private var isDoneTargeted = false

    var body: some View {
        HStack(spacing: 12) {
            let background = KanbanEntity(id: UUID(),
                                      title: "BACKGROUND",
                                      subtitle: "Todo subtitle",
                                      backgroundColor: .cyan,
                                      tasks: backgroundTasks,
                                      isTargeted: isBackGroundTargeted)
            KanbanView(kanban: background)
                .dropDestination(for: DeveloperTaskEntity.self) { dropped, _ in
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
            let todo = KanbanEntity(id: UUID(),
                                      title: "TODO",
                                      subtitle: "Todo subtitle",
                                      backgroundColor: .cyan,
                                      tasks: toDoTasks,
                                      isTargeted: isDoneTargeted)
            KanbanView(kanban: todo)
                .dropDestination(for: DeveloperTaskEntity.self) { dropped, _ in
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
                    inProgressTasks = Array(Set(totalTasks))
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
