import SwiftUI

@main
struct GUIDOMIAApp: App {
    let serviceProvider = ServiceProvider()
    var body: some Scene {
        WindowGroup {
            CarsUseCase(model: serviceProvider.carsUseCaseModel)
                .apply(serviceProvider.styleFactory.carsUseCaseStyle)
        }
    }
}
