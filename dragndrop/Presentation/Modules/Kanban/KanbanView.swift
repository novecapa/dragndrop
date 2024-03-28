//
//  KanbanView.swift
//  dragndrop
//
//  Created by Josep Cerdá Penadés on 28/3/24.
//

import SwiftUI

struct KanbanView: View {

    let kanban: KanbanEntity

    var body: some View {
        VStack(alignment: .center) {
            Text(kanban.title)
                .font(.footnote.bold())

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(kanban.isTargeted ? .teal.opacity(0.15) : Color(kanban.backgroundColor))
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(kanban.tasks, id: \.id) { task in
                            VStack(alignment: .leading,
                                   spacing: 8) {
                                Text(task.title)
                                    .font(.title)
                                Text("@\(task.owner)")
                                    .foregroundColor(.cyan)
                            }
                            .draggable(task)
                            .padding(12)
                            .shadow(radius: 1, x: 1, y: 1)
                            .background(Color(uiColor: .secondarySystemGroupedBackground))
                            .cornerRadius(8)
                        }
                        .padding(EdgeInsets(top: 0,
                                            leading: 2,
                                            bottom: 0,
                                            trailing: 2))
                        Spacer()
                    }
                    .padding(.vertical)
                }
            }
        }
    }
}
#Preview {
    KanbanView(kanban: .mock)
}
