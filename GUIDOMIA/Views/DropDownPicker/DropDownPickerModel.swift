import Foundation


extension DropDownPicker {
    class Model: ObservableObject {
        @Published var values: [String] = []
        @Published var selected: String = ""
        @Published var expanded: Bool = false
        var title: String = ""
        var listen: Closure<String>?
        var selectedIndex: Int {
            values.firstIndex(of: selected) ?? -1
        }
        
        init(selected: String,
             expanded: Bool,
             title: String,
             listen: Closure<String>? = nil) {
            self.selected = selected
            self.expanded = expanded
            self.title = title
            self.listen = listen
        }
        
        func select(_ value: String) {
            selected = value
            expanded = false
            listen?(value)
        }
        
        func toggleExpand() {
            if expanded {
                select("")
            }
            expanded = !expanded
        }
     
    }
}
