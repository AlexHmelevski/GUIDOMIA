import Foundation
import SwiftUI
extension HeaderView {
    struct Configuration {
        let model: Model
        var image: Image {
            .init(model.imageName)
        }
        var topLabel: Text {
            .init(model.topText)
        }
        
        var bottomLabel: Text {
            .init(model.bottomText)
        }
    }
}
