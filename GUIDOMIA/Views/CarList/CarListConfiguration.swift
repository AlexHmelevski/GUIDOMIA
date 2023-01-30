import Foundation
import SwiftUI

extension CarList {
    struct Configuration {
        var model: Model
        
        var headerView: HeaderView {
            .init(model: model.headerViewModel)
        }
        
        var filterView: FilterList {
            .init(model: model.filterModel)
        }
    }
}
