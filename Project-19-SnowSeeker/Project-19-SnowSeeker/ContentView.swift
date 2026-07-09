import SwiftUI

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    var body: some View {
    }
}

#Preview {
    ContentView()
}
