import Foundation
import SwiftUI

extension CarHeader {
    struct Configuration {
        let model: Model

        var image: Image {
            Image(model.imageName)
        }
        var ratingView: RatingView {
            .init(model: model.ratingViewModel)
        }
        var name: Text {
            Text(model.name)
        }
        var price: Text {
            Text(model.price)
        }
    }
}
