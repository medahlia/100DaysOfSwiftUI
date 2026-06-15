import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstName = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastName = ["Granger", "Lovegood", "Potter", "Weasley"]
                    
                    let chosenFirstName = firstName.randomElement()!
                    let chosenLastName = lastName.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
