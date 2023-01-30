import Foundation
import SwiftUI

protocol ViewStyle {
    associatedtype Body : View
    associatedtype Configuration
    
    @ViewBuilder func makeBody(configuration: Self.Configuration) -> Self.Body
}

protocol StylableView: View {
        
    associatedtype Style: ViewStyle
    associatedtype Configuration
    func apply(_ style: Style) -> Self
}

protocol DefaultStylableView: StylableView where Style: ViewStyle {
    associatedtype ViewModel
    init(model: ViewModel, style: Style)
}
