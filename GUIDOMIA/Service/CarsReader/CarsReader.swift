import Foundation

struct CarDataModel: Decodable {
    let make: String
    let marketPrice: Double
    let model: String
    let prosList: [String]
    let consList: [String]
    let rating: Int
    let customerPrice: Double
    var imageURL: String
    enum CodingKeys: CodingKey {
        case make
        case marketPrice
        case model
        case prosList
        case consList
        case rating
        case customerPrice
        case imageURL
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.make = try container.decode(String.self, forKey: .make)
        self.marketPrice = try container.decode(Double.self, forKey: .marketPrice)
        self.model = try container.decode(String.self, forKey: .model)
        self.prosList = try container.decodeIfPresent([String].self, forKey: .prosList) ?? []
        self.consList = try container.decodeIfPresent([String].self, forKey: .consList) ?? []
        self.rating = try container.decode(Int.self, forKey: .rating)
        self.customerPrice = try container.decode(Double.self, forKey: .customerPrice)
        self.imageURL = self.make
    }
}

protocol CarsReader {
    func carModels() async throws -> [CarDataModel]
}

final class CarsReaderJSONMock: CarsReader {
    let resourceReader = BundleResourceReader()
    private struct Cars: Decodable {
        let cars: [CarDataModel]
    }
    
    func carModels() async throws -> [CarDataModel] {
        return  try await resourceReader.getJSONResource(named: "car_list")
    }
}
