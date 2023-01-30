import Foundation
import SwiftUI



extension ListCard {
    
    struct ListCardStyle: ViewStyle {
        let headerStyle: CarHeader.CarHeaderStyle
        let bulletListStyle: BulletList.Style
        let backgroundColor: Color
        let expanded: Bool
        
        static var `default`: Self {
            .init(headerStyle: .default,
                  bulletListStyle: .default,
                  backgroundColor: .white,
                  expanded: false)
        }
        func makeBody(configuration: Configuration) -> some View {
            if expanded  {
                return AnyView(expandedStyle.makeBody(configuration: configuration).background(backgroundColor))
                    
            }
            
            return AnyView(collapsedStyle.makeBody(configuration: configuration).background(backgroundColor))
        }
        
        private var expandedStyle: ListCardStyleExpanded {
            .init(headerStyle: headerStyle, bulletListStyle: bulletListStyle)
        }
        
        private var collapsedStyle: ListCardStyleCollapsed {
            .init(headerStyle: headerStyle)
        }
      
    }
    
    private struct ListCardStyleExpanded: ViewStyle {
        let headerStyle: CarHeader.CarHeaderStyle
        let bulletListStyle: BulletList.Style
        func makeBody(configuration: Configuration) -> some View {
            VStack(alignment: .leading) {
                configuration.header.apply(headerStyle)
                makeExpandedView(configuration: configuration)
            }.padding()
        }
        
        private func makeExpandedView(configuration: Configuration) -> some View {
            VStack(alignment: .leading) {
                configuration.prosList?.apply(bulletListStyle)
                configuration.consList?.apply(bulletListStyle)
            }
            .padding([.leading])
        }
        
    }
    
    private struct ListCardStyleCollapsed: ViewStyle {
        let headerStyle: CarHeader.CarHeaderStyle
        func makeBody(configuration: Configuration) -> some View {
            configuration.header.apply(headerStyle)
                .padding()
        }
    }
}
