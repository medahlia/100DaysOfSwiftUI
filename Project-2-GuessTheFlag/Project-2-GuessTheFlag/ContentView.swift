import SwiftUI


struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}


struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingFinalScore = false
    @State private var showingWrongMessage = false
    @State private var wrongMessage = ""
    
    @State private var score = 0
    @State private var questionCount = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(country: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert("OMG!", isPresented: $showingWrongMessage) {
            Button("Okey, I'll try again", action: askQuestion)
        } message: {
            Text(wrongMessage)
        }
        
        .alert("Super! Your results", isPresented: $showingFinalScore) {
            Button("New game", action: reset)
        } message: {
            Text("Your score: \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        questionCount += 1
        
        if number == correctAnswer {
            score += 1
        } else {
            wrongMessage = "Wrong! That's the flag of \(countries[correctAnswer])"
            showingWrongMessage = true
        }
        
        if questionCount == 8 {
            showingFinalScore = true
        } else {
            askQuestion()
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
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


/*
 ZStack {
     LinearGradient(stops: [
         .init(color: .pink, location: 0.45),
         Gradient.Stop(color: .black, location: 0.55)
     ], startPoint: .top, endPoint: .bottom)
         .ignoresSafeArea()
 
// RadialGradient(colors: [.pink, .black], center: .center, startRadius: 20, endRadius: 200)
 
 // AngularGradient(colors: [.white, .indigo, .white, .indigo, .white, .indigo], center: .bottom)
 
     Text("Hello, Kira!")
         .foregroundStyle(.secondary)
         .font(.title)
         .bold()
         .padding(50)
         .background(.ultraThinMaterial)
     
 }
 */

/*
 Text("Hello, Kira!")
     .frame(maxWidth: .infinity, maxHeight: .infinity)
     .foregroundStyle(.white)
     .background(.indigo.gradient)
 */


/*
 @State private var showingAlert = false
 
 var body: some View {
     Button("show alert") {
         showingAlert = true
     }
     .alert("important message", isPresented: $showingAlert) {
         Button("delete", role: .destructive) { }
         Button("cancel", role: .cancel) {}
     } message: {
         Text("please read this")
     }
 }
 */
