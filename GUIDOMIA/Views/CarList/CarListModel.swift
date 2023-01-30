import Foundation
import Combine

extension CarList {
    struct ListModel {
        var expanded: Bool
        let cardModel: ListCard.Model
        let tap: Closure<String>?
        
        func new(expanded: Bool) -> Self {
            var copy = self
            copy.expanded = expanded
            return copy
        }
        
    }
    
    class Model: ObservableObject {
        @Published var cars: [ListModel] = [] 
        let reader: CarsReader
        let headerViewModel: HeaderView.Model
        let filterModel: FilterList.Model
        private var subscription: AnyCancellable?
        private var dataModels: [CarDataModel] = []
        init(reader: CarsReader, headerViewModel: HeaderView.Model) {
            self.reader = reader
            self.headerViewModel = headerViewModel
            self.filterModel = .init()
            subscription = filterModel.$selected.receive(on: DispatchQueue.main)
                .sink { [weak self] in self?.filterModels(using: $0) }
        }
        
        @MainActor
        func fetchCars() async throws {
            dataModels = try await reader.carModels()
            cars = transform(dataModels: dataModels)
           
            filterModel.filters  = filters
        }
        
        
        var filters: [CarFilter] {
            [
                .init(type: .make,
                      values: dataModels.map({ $0.make })),
                .init(type: .model,
                      values: dataModels.map({ $0.model })),
            ]
        }
        
        private func filterModels(using filters: [CarFilterType: String]) {
            
            let filtered = filters.reduce(dataModels) { partialResult, dictionary in
                filter(data: partialResult, using: dictionary.key, value: dictionary.value)
            }
            cars = transform(dataModels: filtered)
        }
        
        private func transform(dataModels: [CarDataModel]) -> [ListModel] {
            dataModels
            .enumerated()
            .map({($0.element, $0.offset == 0)})
            .map(transformIntoListModel)
        }
      
        
        private func filter(data: [CarDataModel],
                            using type: CarFilterType,
                            value: String) -> [CarDataModel]  {
            guard !value.isEmpty else {
                return data.filter { _ in true }
            }
            switch type {
            case .make:
                return data.filter { $0.make == value }
            case .model:
                return data.filter { $0.model == value }
            }
        }
        
    
        
    
        
        private func transformIntoListModel(_ model: CarDataModel, expanded: Bool) -> ListModel {
            let prosList = extractBulletModel(title: "Pros: ", list: model.prosList)
            let consList = extractBulletModel(title: "Cons: ", list: model.consList)
            let carModel = ListCard.Model(name: [model.make, model.model].joined(separator: " "),
                                          imageName: model.imageURL,
                                          rating: model.rating,
                                          price: "\(model.customerPrice)",
                                          prosList: prosList,
                                          consList: consList,
                                          ratingSymbol: "★")
            return .init(expanded: expanded,
                         cardModel: carModel,
                         tap: { [weak self] in self?.expand(model: $0) })
        }
        
        private func expand(model: String) {
            cars = cars.map({ $0.new(expanded: model == $0.cardModel.name )})
        }
        
        private func extractBulletModel(title: String,
                                        list: [String]) -> BulletList.Model {
            .init(title: title,
                  points: list.filter({ !$0.isEmpty }))
        }
    }
    
  
}



