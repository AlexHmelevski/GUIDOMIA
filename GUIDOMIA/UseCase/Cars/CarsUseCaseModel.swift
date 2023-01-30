import Foundation
import SwiftUI

extension CarsUseCase {
    class Model: ObservableObject {
        let carListModel: CarList.Model
        let navigationBarModel: NavigationBar.Model
        init(carListModel: CarList.Model,
             navigationBarModel: NavigationBar.Model) {
            self.carListModel = carListModel
            self.navigationBarModel = navigationBarModel
        }
        
        
    }
}
