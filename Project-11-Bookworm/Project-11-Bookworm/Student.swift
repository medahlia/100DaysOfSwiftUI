//
//  Student.swift
//  Project-11-Bookworm
//
//  Created by Home on 15.06.2026.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
