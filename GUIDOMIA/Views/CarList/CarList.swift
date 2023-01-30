import SwiftUI

struct CarList: DefaultStylableView {
    typealias ViewModel = Model
    
    typealias Style = CarListStyle
    private let configuration: Configuration
    private let style: Style
    @ObservedObject var model: Model
    init(model: Model, style: CarListStyle = .default) {
        
        self.style = style
        self.model = model
        self.configuration = .init(model: model)
        
    }

    var body: some View {
        style.makeBody(configuration: configuration)
            .onAppear {
                Task {
                    try? await configuration.model.fetchCars()
                }
            }
    }
    
    func apply(_ style: CarListStyle) -> CarList {
        .init(model: configuration.model, style: style)
    }
}

struct CarList_Previews: PreviewProvider {
    static var model: CarList.Model {
        PreviewMocks.CarListMock.model
    }
  
    static var style: CarList.Style {
        PreviewMocks.CarListMock.style
    }
    static var previews: some View {
        CarList(model: model,style: style)
    }
}
