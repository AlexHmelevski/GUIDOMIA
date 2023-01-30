import Foundation
import SwiftUI

extension CarList {
    struct CarListStyle: ViewStyle {
        let cardStyleCollapsed: ListCard.Style
        let cardStyleExpanded: ListCard.Style
        let headerViewStyle: HeaderView.Style
        let filterStyle: FilterList.Style
        let separatorColor: Color
        
        static var `default`: Self {
            .init(cardStyleCollapsed: .default,
                  cardStyleExpanded: .default,
                  headerViewStyle: .default,
                  filterStyle: .default,
                  separatorColor: .brown)
        }
        func makeBody(configuration: Configuration) -> some View {
    
            ScrollView(.vertical) {
                LazyVStack(alignment: .center) {
                    configuration.headerView.apply(headerViewStyle)
                    configuration.filterView.apply(filterStyle)
                        .padding([.leading,.trailing])
                    ForEach(configuration.model.cars, id: \.cardModel.name) { model in
                        createCell(for: model)
                        Divider()
                            .frame(height: 3)
                            .overlay(separatorColor)
                            .padding([.leading,.trailing])
                    }
                }

            }
        }
        
        private func createCell(for model: ListModel) -> some View {
            ListCard(model: model.cardModel)
                .apply(model.expanded ? cardStyleExpanded: cardStyleCollapsed)
                .onTapGesture {
                    model.tap?(model.cardModel.name)
                }

        }
    }
}
