import Foundation
import SwiftUI

extension RatingView {
    struct Configuration {
        let model: Model
        
        func viewForSymbol(_ symbol: String) -> Text {
            Text(symbol)
        }
    }
}
