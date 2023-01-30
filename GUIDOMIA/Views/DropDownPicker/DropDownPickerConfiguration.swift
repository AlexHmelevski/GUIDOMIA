import Foundation
import SwiftUI
extension DropDownPicker {
    struct Configuration {
        let model: Model
        
        var count: Int {
            model.values.count
        }
        var selectedIndex: Int {
            model.selectedIndex
        }
        
        var buttons: [Button<Text>] {
            model.expanded ? model.values.map(createButton) : []
        }
        
        var placeholder: Button<Text> {
            let placeholder = shouldShowTitle ? model.title : model.selected
            return .init(placeholder, action: { [weak model] in model?.toggleExpand() })
        }
        
        var shouldShowTitle: Bool {
            if model.expanded { return true }
            return model.selected.isEmpty
        }
        
        private func createButton(with value: String) -> Button<Text> {
            .init(value, action: { [weak model] in model?.select(value) })
        }
    }
}
