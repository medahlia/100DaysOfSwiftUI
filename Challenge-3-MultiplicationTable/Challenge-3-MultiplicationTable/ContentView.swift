import SwiftUI


struct ContentView: View {
    @State private var number = 0
    let numbersOfQuestions = [5, 7, 10]
    @State private var numberOfQuestions = 7
    @State private var favColor = Color(.pink)
    
    @State private var showingQuestions = false
    
    var body: some View {
        ZStack {
            VStack {
                Form {
                    Picker("Choose a number of table", selection: $number) {
                        ForEach(1..<11) {
                            Text("\($0)")
                        }
                    }
                    Section("Choose a number of questions") {
                        Picker("Choose a number of questions", selection: $numberOfQuestions) {
                            ForEach(numbersOfQuestions, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section("Choose your fav color") {
                        ColorPicker("fav color", selection: $favColor)
                            .pickerStyle(.palette)
                    }
                }
                
                Button("Start Game") {
                    showingQuestions = true
                }
                .frame(width: 200, height: 50)
                .background(favColor)
                .foregroundStyle(.white)
                .font(.title)
                .clipShape(.rect(cornerRadius: 30))
                .sheet(isPresented: $showingQuestions) {
                    QuestionsView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
