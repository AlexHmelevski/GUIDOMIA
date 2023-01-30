import Foundation
import SwiftUI

extension FilterList {
    struct FilterListStyle: ViewStyle {
        let textColor: Color
        let textFont: Font
        let backgroundColor: Color
        let cornerRadius: CGFloat
        let pickerStyle: DropDownPicker.Style
        
        static var `default`: Self {
            .init(textColor: .accentColor,
                  textFont: .title,
                  backgroundColor: .accentColor,
                  cornerRadius: 0,
                  pickerStyle: .default)
        }
        func makeBody(configuration: Configuration) -> some View {
            let pickers = configuration.dropDownPickers
            return VStack(alignment: .leading) {
                
                ForEach(0..<pickers.count, id: \.self) { index in
                    pickers[index].apply(pickerStyle)
                        .padding( index == 0 ? [.top,.bottom] : .bottom)
                        .padding([.leading, .trailing])
                }
                
            }
            
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
        }
        
        private func makePickerContent(values: [String]) -> some View {
            ForEach(values, id: \.self) {
                Text($0)
                    .foregroundColor(textColor)
                    .font(textFont)
            }
        }
    }
}
