import Foundation

extension ListCard {
    struct Configuration {
        
        let model: Model

        var header: CarHeader {
            .init(model: carHeaderModel)
        }
        
        var prosList: BulletList? {
            model.prosList.isEmpty ? nil :
            .init(model: model.prosList)
        }
        var consList: BulletList? {
            model.consList.isEmpty ? nil :
            .init(model: model.consList)
        }
        
        private var carHeaderModel: CarHeader.Model {
            .init(name: model.name,
                  imageName: model.imageName,
                  rating: model.rating,
                  price: model.price,
                  ratingSymbol: model.ratingSymbol)
        }
        
    }
}
