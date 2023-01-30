import SwiftUI

import Foundation

extension CarHeader {
    struct CarHeaderStyle: ViewStyle {
        let ratingStyle: RatingView.RatingViewStyle
        let nameColor: Color
        let nameFont: Font
        let priceColor: Color
        let priceFont: Font
        
        static var `default`: CarHeaderStyle {
            .init(ratingStyle: .default,
                  nameColor: .accentColor,
                  nameFont: .body,
                  priceColor: .accentColor,
                  priceFont: .body)
        }
        
        func makeBody(configuration: Configuration) -> some View {

                HStack(alignment: .top) {
                    configuration.image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    verticalStackInfo(from: configuration)
                    Spacer()
                }
        }
        
        func verticalStackInfo(from configuration: Configuration) -> some View {
            VStack(alignment: .leading) {
                configuration.name
                    .font(nameFont)
                    .foregroundColor(nameColor)
                configuration.price
                    .font(priceFont)
                    .foregroundColor(priceColor)
                configuration.ratingView.apply(ratingStyle)
                
            }
           
        }
        
    }
}
