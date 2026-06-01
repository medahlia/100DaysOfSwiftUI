import SwiftUI

struct ContentView: View {
    @State private var inputTime = 0.0
    @State private var inputMeasurement = "h"
    @State private var outputMeasurement = "min"
    
    let measurements = ["sec", "min", "h", "d"]
    let factors: [Double] = [1, 60, 60*60, 60*60*24]
    
    var result: Double {
        let inputIndex = measurements.firstIndex(of: inputMeasurement) ?? 0
        let outputIndex = measurements.firstIndex(of: outputMeasurement) ?? 0
        
        return inputTime * factors[inputIndex] / factors[outputIndex]
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Convert from") {
                    Picker("Measurements for input", selection: $inputMeasurement) {
                        ForEach(measurements, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    TextField("Enter time", value: $inputTime, format: .number)
                }
                
                
                Section("Convert to") {
                    Picker("Measurements for output", selection: $outputMeasurement) {
                        ForEach(measurements, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    //Text(result, format: .number)
                    Text(result.formatted())
                }
            }
            .navigationTitle("Time Conversion")
        }
    }
}

#Preview {
    ContentView()
}
