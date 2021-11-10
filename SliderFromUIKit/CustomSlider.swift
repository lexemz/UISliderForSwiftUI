//
//  CustomSlider.swift
//  SliderFromUIKit
//
//  Created by Igor on 09.11.2021.
//

import SwiftUI

struct CustomSlider: UIViewRepresentable {
    @Binding var value: Float
    var alpha: CGFloat
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100

        
        slider.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: alpha)
        slider.value = value
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderDidChangeValue),
            for: .allEvents
        )

        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.setValue(value, animated: true)
        uiView.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
}

extension CustomSlider {
    class Coordinator: NSObject {
        @Binding var value: Float

        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func sliderDidChangeValue(_ sender: UISlider) {
            value = sender.value
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(value: .constant(50), alpha: 50)
    }
}
