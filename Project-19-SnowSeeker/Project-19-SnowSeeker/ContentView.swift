import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            NavigationLink("Primary") {
                Text("new view")
            }
        } detail: {
            Text("Content")
                .toolbar(.hidden, for: .navigationBar)
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    ContentView()
}
