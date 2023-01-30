import SwiftUI

extension BulletList {
    struct BulletListStyle: ViewStyle {
        let bulletColor: Color
        let bulletFont: Font
        let textColor: Color
        let textFont: Font
        let titleColor: Color
        let titleFont: Font
        let symbol: String
        func makeBody(configuration: Configuration) -> some View {
            VStack(alignment: .leading) {
                configuration.title
                    .font(titleFont)
                    .foregroundColor(titleColor)
                   
                HStack {
                    bulletPointList(configuration: configuration)
                        .padding(.leading)
                }
            }
        }
    
        static var `default`: Self {
            .init(bulletColor: .accentColor,
                  bulletFont: .callout,
                  textColor: .accentColor,
                  textFont: .callout,
                  titleColor: .accentColor,
                  titleFont: .callout, symbol: "*")
        }
        
        private func bulletPointList(configuration: Configuration) -> some View {
            VStack(alignment: .leading) {
                ForEach(0..<configuration.bulletPoints.count, id: \.self) {
                    makeBulletRow(point: configuration.bulletPoints[$0])
                }
            }
        }
        
        private func makeBulletRow(point: Text) -> some View {
            HStack(alignment: .top) {
                Text(symbol)
                    .font(bulletFont)
                    .foregroundColor(bulletColor)
                point
                    .font(textFont)
                    .foregroundColor(textColor)
            }
        }
    }
}
