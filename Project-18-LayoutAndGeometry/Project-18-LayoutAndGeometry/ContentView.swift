import SwiftUI

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@sheldon")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[VerticalAlignment.center]
                    }
                
                Image(.sheldonCooper)
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("SHELDON COOPER")
                    .alignmentGuide(.midAccountAndName, computeValue: { d in
                        d[VerticalAlignment.center]
                    })
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    ContentView()
}
