import SwiftUI

struct ContentView: View {
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        let comdined = pressGesture.sequenced(before: dragGesture)
        
        Circle()
            .fill(.purple)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(comdined)
    }
}

#Preview {
    ContentView()
}
