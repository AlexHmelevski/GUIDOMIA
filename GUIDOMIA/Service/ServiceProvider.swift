import Foundation

final class ServiceProvider {
    var styleFactory: StylesFactory {
        DefaultFactory()
    }
    
    var carsReader: CarsReader {
        CarsReaderJSONMock()
    }
    
    var carsListModel: CarList.Model {
        .init(reader: carsReader, headerViewModel: carsHeaderModel)
    }
    
    var carsUseCaseModel: CarsUseCase.Model {
        .init(carListModel: carsListModel,
              navigationBarModel: navigationBarModel)
    }
    
    var carsHeaderModel: HeaderView.Model {
        .init(imageName: "Tacoma",
              topText: "Tacoma 2021 ",
              bottomText: "Get your's now")
    }
    
    
    var navigationBarModel: NavigationBar.Model {
        .init(text: "GUIDOMIA", buttonImage: "heart.fill", action: nil)
    }
    
    var filterListModel: FilterList.Model {
        .init()
    }
}
