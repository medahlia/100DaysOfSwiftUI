import SwiftUI


struct ContentView: View {
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
