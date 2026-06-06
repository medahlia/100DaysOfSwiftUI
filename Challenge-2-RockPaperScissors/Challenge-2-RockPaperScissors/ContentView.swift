import SwiftUI


struct ContentView: View {
    private let tools = ["🪨", "✂️", "📃"]
    @State private var appChoice = Int.random(in: 0...2)
    @State private var mode = Bool.random()
    
    @State private var score = 0
    @State private var questionCount = 0
    
    let winningMoves = [1, 2, 0]
    
    @State private var showingFinalScore = false
    @State private var showingWrongMessage = false
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [.mint, .black], center: .topTrailing, startRadius: 100, endRadius: 700)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                
                Spacer()
                
                Text("Brain Training")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack {
                    Text("Rock • Paper • Scissors")
                        .font(.title.bold())
                        .foregroundStyle(.secondary)
                    HStack(spacing: 30) {
                        Text(tools[appChoice])
                            .font(.system(size: 100))
                        Text(mode ? "win" : "lose")
                            .font(.title.bold())
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(mode ? Color.green.opacity(0.7) : Color.red.opacity(0.7), lineWidth: 8)
                            )
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                HStack(spacing: 40) {
                    ForEach(0..<3) { index in
                        Button(tools[index]) {
                            playerTapped(index)
                        }
                    }
                }
                .font(.system(size: 60))
                .frame(maxWidth: .infinity)
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert("Mistake!", isPresented: $showingWrongMessage) {
            Button("Continue :)", action: askQuestion)
        }
        .alert("Congrats!", isPresented: $showingFinalScore) {
            Button("New Game", action: reset)
        } message: {
            Text("Your score: \(score)")
        }
    }
    
    func playerTapped(_ move: Int) {
        questionCount += 1
        
        var correctMove: Int
        
        if mode {
            switch appChoice {
            case 0:
                correctMove = 2
            case 1:
                correctMove = 0
            default:
                correctMove = 1
            }
        } else {
            switch appChoice {
            case 0:
                correctMove = 1
            case 1:
                correctMove = 2
            default:
                correctMove = 0
            }
        }
        
        if move == correctMove {
            score += 1
        } else {
            showingWrongMessage = true
        }
        
        if questionCount == 10 {
            showingFinalScore = true
        } else {
            askQuestion()
        }
    }
    
    func askQuestion() {
        appChoice = Int.random(in: 0...2)
        mode.toggle()
    }
    
    func reset() {
        score = 0
        questionCount = 0
        askQuestion()
    }
}

#Preview {
    ContentView()
}
