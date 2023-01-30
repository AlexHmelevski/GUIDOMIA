import SwiftUI

extension HeaderView {
    struct HeaderViewStyle: ViewStyle {
        let foregroundColor: Color
        let topTextFont: Font
        let bottomTextFont: Font
        var paddings: EdgeInsets = .init(top: 8, leading: 16, bottom: 32, trailing: 16)
        static var `default`: Self {
            .init(foregroundColor: .accentColor,
                  topTextFont: .title,
                  bottomTextFont: .title)
        }
        func makeBody(configuration: Configuration) -> some View {
            configuration.image.resizable().scaledToFit()
                .overlay(alignment: .bottomLeading) {
                    overlay(for: configuration)
                }
        }
        
        private func overlay(for config: Configuration) -> some View {
            verticalStack(for: config).padding(paddings)
        }
        
        private func verticalStack(for config: Configuration) -> some View {
            VStack(alignment: .leading) {
                config.topLabel
                    .foregroundColor(foregroundColor)
                    .font(topTextFont)
                config.bottomLabel
                    .foregroundColor(foregroundColor)
                    .font(bottomTextFont)
            }
        }
    }
}



