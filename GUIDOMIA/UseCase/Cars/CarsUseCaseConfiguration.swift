import Foundation

extension CarsUseCase {
    struct Configuration {
        let model: Model
        
        var listView: CarList {
            .init(model: model.carListModel)
        }
        
        var navigationBar: NavigationBar {
            .init(model: model.navigationBarModel)
        }
    }
}
