//
//  KanbanView.swift
//  dragndrop
//
//  Created by Josep Cerdá Penadés on 28/3/24.
//

import SwiftUI

struct KanbanView: View {
    
    let title: String
    let tasks: [DeveloperTaskEntity]
    let isTargeted: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.footnote.bold())
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(isTargeted ? .teal.opacity(0.15) : Color(.secondarySystemFill))
                
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(tasks, id: \.id) { task in
                        Text(task.title)
                            .padding(12)
                            .background(Color(uiColor: .secondarySystemGroupedBackground))
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                            .draggable(task)
                    }
                    
                    Spacer()
                }
                .padding(.vertical)
            }
        }
    }
}
