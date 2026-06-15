import SwiftData
import SwiftUI

@main
struct Project_11_BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}
