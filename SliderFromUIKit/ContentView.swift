//
//  ContentView.swift
//  SliderFromUIKit
//
//  Created by Igor on 09.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 1...100)
    @State private var currentValue = Float.random(in: 1...100)
    
    @State private var alertPresented = false

    var body: some View {
        let resultValueBinding = Binding(
            get: { CGFloat(self.computeScore()) / 100 },
            set: { _ in }
        )
        
        
        VStack {
            Text("Установите слайдер к \(targetValue)")

            Button(action: shuffleDesiredValue) {
                Text("Изменить число")
            }
            
            
            HStack {
                Text("0")
                CustomSlider(value: $currentValue, alpha: resultValueBinding)
                Text("100")
            }
            
            Button("Результат", action: resultPressed)
            .alert("Результат", isPresented: $alertPresented, actions: {}) {
                    Text("\(computeScore())")
                }
        }
        .padding()
    }

    private func shuffleDesiredValue() {
        targetValue = Int.random(in: 1...100)
        currentValue = Float.random(in: 1...100)
    }
    
    private func resultPressed() {
        alertPresented = true
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
