import SwiftUI

extension  BulletList {
    struct Model {
        let title: String
        let points: [String]
        var isEmpty: Bool {
            points.isEmpty
        }
    }
}


