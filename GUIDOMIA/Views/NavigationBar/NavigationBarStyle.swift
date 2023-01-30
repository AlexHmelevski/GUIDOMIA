import Foundation
import SwiftUI
extension NavigationBar {
    struct BarStyle: ViewStyle  {
        let background: Color
        let foregroundColor: Color
        let textFont: Font
        let imageName: String
        func makeBody(configuration: Configuration) -> some View {
            HStack {
                configuration.label.foregroundColor(foregroundColor)
                Spacer()
                configuration.button(with: imageName).scaledToFit().foregroundStyle(foregroundColor)
                
            }.padding(.all)
            .background(background)
            
        }
        
        static var defaultStyle: Self {
            .init(background: Color.black,
                  foregroundColor: .green,
                  textFont: .footnote,
                  imageName: "")
        }
    }
}
