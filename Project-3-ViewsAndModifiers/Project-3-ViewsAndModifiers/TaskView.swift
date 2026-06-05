import SwiftUI


struct BlueTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(.blue)
    }
}

extension View {
    func blueStyle() -> some View {
        modifier(BlueTitleStyle())
    }
}



struct TaskView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .blueStyle()
        
    }
}

#Preview {
    TaskView()
}
