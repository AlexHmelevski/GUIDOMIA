import SwiftUI

extension BulletList {
    struct Configuration {
        let model: Model
        
        var title: Text {
            Text(model.title)
        }
        
        var bulletPoints: [Text] {
            model.points.map(Text.init)
        }
        
    }
}

