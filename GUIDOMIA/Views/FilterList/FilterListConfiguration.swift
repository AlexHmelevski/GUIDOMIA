import Foundation
import SwiftUI
import Combine
extension FilterList {
    struct Configuration {
        let model: Model
  
        typealias PickerView = Picker<Text, String, AnyView>
        
        var count: Int {
            model.filters.count
        }
        
        var dropDownPickers: [DropDownPicker] {
            model.filters.map({ filter in
                let m = DropDownPicker.Model(selected: model.getSelectedFilterValue(of: filter.type),
                                     expanded: false,
                                     title: filter.type.filterMessage) { [weak model] in
                    model?.selectValue($0, for: filter.type)
                }
                m.values = filter.values
        
                return DropDownPicker(model: m, style: .default)
            })
        }
        
    }
}
