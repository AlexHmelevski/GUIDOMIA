import Foundation


extension ListCard {
    struct Model {
        let name: String
        let imageName: String
        let rating: Int
        let price: String
        let prosList: BulletList.Model
        let consList: BulletList.Model
        let ratingSymbol: String
    }
    
}
