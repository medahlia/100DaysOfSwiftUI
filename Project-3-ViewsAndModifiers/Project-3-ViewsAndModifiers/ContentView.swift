import SwiftUI

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.pink)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 20) {
            CapsuleText(text: "vvvv")
            CapsuleText(text: "jjjj")
            Text("vvvv")
            Text("aaaa")
            Text("dddd")
                .modifier(Title()) // pink
            Text("kkkk")
                .titleStyle() // pink
            
            Color.indigo
                .frame(width: 300, height: 200)
                .watermarked(with: "SwiftUI")
        }
        
    }
}

#Preview {
    ContentView()
}
