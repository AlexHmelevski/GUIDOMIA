import Foundation
import SwiftUI

extension NavigationBar {
    
    struct Configuration {

        let action: VoidClosure
        let text: String
        
        var label: Text {
            Text(text)
        }
        
        func button(with imageName: String) -> Button<Image> {
            .init(action: action) {
                Image(systemName: imageName)
            }
        }
    }
    
   
}

