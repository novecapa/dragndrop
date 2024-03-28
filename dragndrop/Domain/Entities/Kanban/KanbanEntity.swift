//
//  KanbanEntity.swift
//  dragndrop
//
//  Created by Josep Cerdá Penadés on 28/3/24.
//

import Foundation
import UIKit

struct KanbanEntity {
    let id: UUID
    let title: String
    let subtitle: String
    let backgroundColor: UIColor
    let tasks: [DeveloperTaskEntity]
    let isTargeted: Bool
}

extension KanbanEntity {
    static let mock: KanbanEntity = KanbanEntity(id: UUID(),
                            title: "TODO",
                            subtitle: "",
                            backgroundColor: .green,
                            tasks: DeveloperTaskEntity.mock,
                            isTargeted: false)
}
