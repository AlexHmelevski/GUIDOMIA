
import SwiftUI

extension CarsUseCase {
    struct CarsUseCaseStyle: ViewStyle {
        let listStyle: CarList.Style
        let navigationBarStyle: NavigationBar.Style
        static var `default`: Self {
            .init(listStyle: .default, navigationBarStyle: .defaultStyle)
        }
        
        func makeBody(configuration: Configuration) -> some View {
            VStack(spacing: 0) {
                configuration.navigationBar.apply(navigationBarStyle)
                configuration.listView.apply(listStyle)
            }
        }
    }
}
