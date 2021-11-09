//
//  ContentView.swift
//  SliderFromUIKit
//
//  Created by Igor on 09.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var desiredValue = Int.random(in: 1...100)

    var body: some View {
        VStack {
            Text("Установите слайдер к \(desiredValue)")

            Button(action: shuffleDesiredValue) {
                Text("Перемешать число")
            }
                
        }
        .padding()
    }

    private func shuffleDesiredValue() {
        desiredValue = Int.random(in: 1...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
