//
//  CustomExtensions.swift
//  dragndrop
//
//  Created by Josep Cerdá Penadés on 28/3/24.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static let developerTask = UTType(exportedAs: "com.daapcoders.developertastk")
}

extension Array where Element: Hashable {
    var removeDuplicates: [Element] {
        Array(Set(self))
    }
}
