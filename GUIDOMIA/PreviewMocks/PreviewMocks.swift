
import Foundation
import SwiftUI
struct PreviewMocks {
    static let stylesFactory = DefaultFactory()
}

extension PreviewMocks {
    struct NavigationBarMock {
        static var style: NavigationBar.BarStyle {
            .defaultStyle
        }
        
        static var model: NavigationBar.Model {
            .init(text: "GUIDOMIA",
                  buttonImage: "heart.fill",
                  action: {})
        }
    }
}

extension PreviewMocks {
    struct RatingViewMock {
        static var model: RatingView.Model {
            .init(count: 4)
        }
        
        static var style: RatingView.Style {
            stylesFactory.ratingStyle
        }
    }
}


extension PreviewMocks {
    struct BulletListMock {
        static var model: BulletList.Model {
            bulletListModel(with: "PROS: ")
        }
        
        static var style: BulletList.Style {
            stylesFactory.bulletListStyle
        }

        static func bulletListModel(with title: String) -> BulletList.Model {
            .init(title: title,
                  points: ["point 1", "point 2"])
        }
    }
}


extension PreviewMocks {
    struct CarHeaderMock {
        static var model: CarHeader.Model {
            .init(name: "Alpine Roadster",
                  imageName: "Tacoma",
                  rating: 4,
                  price: "120k",
                  ratingSymbol: "★")
        }
        
        static var style: CarHeader.CarHeaderStyle {
            stylesFactory.carHeaderStyle
        }
    }
}


extension PreviewMocks {
    struct ListCardMock {
        static var model: ListCard.Model {
            cardModel(with: "Alpine Roadster")
        }
        
        
        static func cardModel(with name: String) -> ListCard.Model {
            .init(name: name,
                  imageName: "Tacoma",
                  rating: 4,
                  price: "Price: 120k",
                  prosList: BulletListMock.bulletListModel(with: "Pros"),
                  consList: BulletListMock.bulletListModel(with: "Cons"),
                  ratingSymbol: "★")
        }
        
        static func style(expanded: Bool) -> ListCard.Style {
            stylesFactory.carStyle(expanded: expanded)
        }
        
    
        
    }
}


extension PreviewMocks {
    struct CarListMock {
        static var model: CarList.Model {
            let model = CarList.Model(reader: CarsReaderJSONMock(),
                                      headerViewModel: PreviewMocks.HeaderViewMock.model)
        
            model.cars = cars
            return model
         
        }
        
        static var cars: [CarList.ListModel] {
            [
                .init(expanded: true,
                      cardModel: ListCardMock.cardModel(with: "Tesla"),
                      tap: nil),
                .init(expanded: false,
                      cardModel:  ListCardMock.cardModel(with: "Tacoma"),
                      tap: nil)
            ]
        }

        static var style: CarList.Style {
            stylesFactory.carListStyle
        }
    }
}

extension PreviewMocks {
    struct HeaderViewMock {
        static var model: HeaderView.Model  {
            .init(imageName: "Tacoma", topText: "Tacoma 2021 ", bottomText: "Get your's now")
        }
        static var style: HeaderView.Style {
            stylesFactory.headerStyle
        }
    }
}


extension PreviewMocks {
    struct CarsUseCaseMock {
        static var style: CarsUseCase.Style {
            stylesFactory.carsUseCaseStyle
        }
        
        static var model: CarsUseCase.Model {
            .init(carListModel: PreviewMocks.CarListMock.model,
                  navigationBarModel: PreviewMocks.NavigationBarMock.model)
        }
    }
}


extension PreviewMocks {
    struct FilterListMock {
        static var style: FilterList.Style {
            stylesFactory.filterListStyle
        }
        
        static var model: FilterList.Model {
           let m = FilterList.Model()
            m.filters = [.init(type: .make, values: ["BME", "RANGE"]),
                         .init(type: .model, values: ["1", "2", "3"])
            ]
            return m
        }
    }
}


extension PreviewMocks {
    struct DropDownPickerMock {
        static var model: DropDownPicker.Model {
            let m = DropDownPicker.Model(selected: "",
                                         expanded: false,
                                         title: "Select Number")
            m.values = ["1","2","3"]

            return m
        }
        
        static var style: DropDownPicker.Style {
            stylesFactory.dropDownStyle
        }
    }
}
