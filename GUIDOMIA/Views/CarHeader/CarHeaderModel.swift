import Foundation

extension CarHeader {
    struct Model {
        let name: String
        let imageName: String
        let rating: Int
        let price: String
        let ratingSymbol: String
        var ratingViewModel: RatingView.Model {
            .init(count: rating)
        }
    }
}
