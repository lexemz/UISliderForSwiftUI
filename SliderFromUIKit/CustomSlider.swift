//
//  CustomSlider.swift
//  SliderFromUIKit
//
//  Created by Igor on 09.11.2021.
//

import SwiftUI

struct CustomSlider: UIViewRepresentable {
    @Binding var value: Float
    
    // Создаем элемент
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100

        
        slider.value = value
        slider.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: CGFloat(value / 100))
        
        // Связь метода из координатора с UIKit элементом
        slider.addTarget(
            context.coordinator, // класс, в котором есть требуемый метод. Он доступен через параметр метода - context
            action: #selector(Coordinator.sliderDidChangeValue), // имя метода из класса выше
            for: .allEvents // момент вызова метода
        )

        return slider
    }
    
    // Обновить представление
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
        uiView.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: CGFloat(value / 100))
    }
    
    // Создать координатор для потока данных
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
}

extension CustomSlider {
    // Класс-координатор для потока данных между UIKit и SwiftUI
    class Coordinator: NSObject {
        @Binding var value: Float // Свойство посредник

        // для класса инициализатор создается вручную
        init(value: Binding<Float>) {
            // Binding - обертка и внутрь неё нужно передать данныем через _
            self._value = value
        }
        
        // действие, которое будет совершено при передаче данных
        @objc func sliderDidChangeValue(_ sender: UISlider) {
            value = sender.value
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(value: .constant(5))
    }
}
