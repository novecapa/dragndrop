//
//  DeveloperTaskEntity.swift
//  dragndrop
//
//  Created by Josep Cerdá Penadés on 28/3/24.
//

import SwiftUI

struct DeveloperTaskEntity: Codable, Hashable, Transferable {

    let id: UUID
    let title: String
    let owner: String
    let note: String

    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .developerTask)
    }

    static let mock: [DeveloperTaskEntity] = [
        DeveloperTaskEntity(id: UUID(),
                            title: "Migrate to new API from NG .dev",
                            owner: "Josep",
                            note: "Note 1"),
        DeveloperTaskEntity(id: UUID(),
                            title: "Learn about GeometryReader",
                            owner: "Josep",
                            note: "Note 2"),
        DeveloperTaskEntity(id: UUID(),
                            title: "Technical Coffee",
                            owner: "Josep",
                            note: "Note 3")
    ]
}
