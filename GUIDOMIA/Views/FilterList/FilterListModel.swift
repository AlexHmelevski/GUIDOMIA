import Foundation
enum CarFilterType: String {
    case model
    case make
    
    var filterMessage: String {
        switch self {
        case .model:
           return  "Any Model"
        case .make:
            return "Any Make"
        }
    }
    
}

struct CarFilter: Hashable {
    let type: CarFilterType
    let values: [String]
}

protocol FilerModel {
    var title: String { get }
    var values: [String] { get }
}


extension FilterList {
    class Model: ObservableObject {
        @Published var filters: [CarFilter] = []
        
        @Published var selected: [CarFilterType: String] = [:]
        var selectedFeedback: Closure<(String, CarFilterType)>?
        func selectValue(_ value: String, for type: CarFilterType) {
            var new = selected
            new[type] = value
            selected = new
         
        }
        
        func getSelectedFilterValue(of type: CarFilterType) -> String {
            selected[type] ?? ""
        }
    }
}
