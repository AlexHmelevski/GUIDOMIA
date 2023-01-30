import Foundation
import SwiftUI

extension DropDownPicker {
    struct DropDownPickerStyle: ViewStyle {
        let backgroundColor: Color
        let titleFont: Font
        let titleColor: Color
        let optionsFont: Font
        let optionsColor: Color
        let selectedFont: Font
        let selectedColor: Color
        let cornerRadius: CGFloat
        static var `default`: Self {
            .init(backgroundColor: .accentColor,
                  titleFont: .title,
                  titleColor: .accentColor,
                  optionsFont: .title,
                  optionsColor: .accentColor,
                  selectedFont: .title,
                  selectedColor: .accentColor,
                  cornerRadius: 2)
        }
        
        func makeBody(configuration: Configuration) -> some View {
            let buttons = configuration.buttons
            return VStack {
                configuration.placeholder
                    .buttonStyle(.borderless)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(titleColor)
                    .font(titleFont)
                ForEach(0..<buttons.count, id: \.self) { index in
                    return buttons[index]
                        .buttonStyle(.borderless)
                        .frame(maxWidth: .infinity)
                        .font(configuration.selectedIndex == index ? selectedFont : optionsFont )
                        .foregroundColor(configuration.selectedIndex == index ? selectedColor : optionsColor)
                }
              
            }
            .padding([.top, .bottom], 4)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
        }
        
        
    }
}
