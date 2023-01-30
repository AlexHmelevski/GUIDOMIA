import SwiftUI

extension RatingView {
    struct RatingViewStyle: ViewStyle {
        let foregroundColor: Color
        let font: Font
        let symbol: String
        func makeBody(configuration: Configuration) -> some View {
            HStack {
                ForEach(0..<configuration.model.count, id: \.self) { index in
                    configuration.viewForSymbol(symbol)
                        .font(font)
                        .foregroundColor(foregroundColor)
                }
            }
        }
        
        static var `default`: Self {
            .init(foregroundColor: .blue, font: .title, symbol: "@")
        }
    }
}



